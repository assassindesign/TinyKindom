package test
{

	
	import org.flixel.*;
	
	import test.Bee;
	
	public class TestState extends FlxState
	{
		
		private var _bee:Bee 
		private var emitter:FlxEmitter = new FlxEmitter();
		private var _s:FlxStats =new FlxStats()
		
			
		private var _btn1:FlxButton = new FlxButton(220,5,onSub,80,40);
		private var _btn2:FlxButton = new FlxButton(220,55,onPlus,80,40)
		private var _tNum:FlxText = new FlxText(100,40,130,"70 particles",true)	
//        private var t1:FlxText = new FlxText(0,420,300);
//		public var t2:FlxText = new FlxText(0,450,300);
			
		
		public function TestState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create()
			this._tNum.size = 20
			this.add(this._s);
		 
				
			
//			t1.text = Accelerometer.isSupported.toString()
			
//			this.add(t1)
//			this.add(t2);
		    this.add(this._tNum)
			var t1:FlxText = new FlxText(0,0,80," -10",true)
				t1.size = 30
			var t2:FlxText = new FlxText(0,0,80," +10",true)
			t2.size = 30
			this._btn1.loadText(t1)
			this._btn2.loadText(t2)
			this.add(_btn1)
			this.add(_btn2);
			
			this.add(this._bee  = new Bee());
		    this._bee.x = 200
			emitter.delay = 1;
			emitter.maxRotation = 160;
			emitter.setXSpeed(-300, 300);
			emitter.setYSpeed(-300, 300);
			var particles: int = 70;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxSprite = new FlxSprite();
				particle.createGraphic(20, 20, 0xFF597137);
				particle.exists = false;
				emitter.add(particle);
				 
			}
			add(emitter);
			
			
			
		}
		
		
 
	   private function onSub():void
	   {
		   if(this.emitter.members.length >10)this.emitter.members.length -= 10
			   
			this._tNum.text = this.emitter.members.length.toString()+" particles"
	   }
	   
	   private function onPlus():void
	   {
		  
		   for(var i: int = 0; i < 10; i++)
		   {
			   var particle:FlxSprite = new FlxSprite();
			   particle.createGraphic(20, 20, 0xFF597137);
			   particle.exists = false;
			   emitter.add(particle);
			   
		   }
		   this._tNum.text = this.emitter.members.length.toString()+" particles"
	   }
		
		override public function update():void
		{
			super.update()
				
			if(FlxG.mouse.justPressed())
			{
				this.emitter.x = FlxG.mouse.x
				this.emitter.y = FlxG.mouse.y
				this.emitter.start(true,3);
			}	
				
//			t1.text = "bee.velocity : "+this._bee.velocity.x.toString()+"   "+this._bee.velocity.y.toString()
			
//			this._bee.velocity.y = 10//this._accZ 
				
//			if(this.x<0 || this.x > FlxG.width - this._bee.width){this._bee.velocity.x = -this._bee.velocity.x }
			 
			
//			if(this.y< 0 || this.y> FlxG.height - this._bee.height){this._bee.velocity.y = -this._bee.velocity.y}
			 
				
			//player.collide(this.playerGroup);
			
		}
	}
}