package
{
	import flash.display.BitmapData;
	
	import org.flixel.*;
	
	public class Bullet extends FlxSprite
	{
 
		[Embed(source="data/bullets2.png")]private var ImgBullets:Class;
		private var _type:String = "red" // red ,yellow ,blue ,green
		private var _level:uint = 1   //1~5
		private var _damage:Number = 0
		public function Bullet()
		{
			super();
			this.loadGraphic(ImgBullets,true,false,50,50);
			

			this.addAnimation("yellow1",[18])
			this.addAnimation("yellow2",[19])
			this.addAnimation("yellow3",[20])
			this.addAnimation("yellow4",[21])
			this.addAnimation("yellow5",[22])	
				
 
				
 
			this.addAnimation("Over",[23,24,25,26],5,false)
	 
				
				
		}
		
		private var _toBeKilled:Boolean = false
		private var _toBeKilledTime:Number = 0
		public function nextkill(p_second:Number = 2):void
		{
			if(this._toBeKilled)return
				
			this._toBeKilled = true
			/*if(_toBeKilled > 3)
			{
//				trace("kill")
				this._toBeKilled =  0
				this.kill()
			}else
			{
				this._toBeKilled ++
			}*/
			
		}
		
		public function get type():String
		{
			return this._type
		}
		
		override public function update():void
		{ 
			super.update();
			if(!this.alive && finished){
				exists = false;
			}
			else if(this.alive){
			
	 
				if(this.touching|| this.y< -this.height || this.x< -this.width || this.x>FlxG.width || this.y>FlxG.height)
				{
				
				this.kill()
					
				}
				
			} 
		}
		
		override public function kill():void
		{
			if(!this.alive) return;
			play("Over");
			
			velocity.x = 0;
			velocity.y = 0;
//			if(onScreen()) FlxG.play(SndHit);
//			dead = true;
            this.solid = false
			this.alive = false
		}
		
		public function shoot(X:int, Y:int, VelocityX:int, VelocityY:int,TYPE:String = "red" ,LEVEL:uint =  1):void
		{
 
			super.reset(X-this.width*.5,Y);		
		    this.alive = this.exists = true
			this.solid = true
			velocity.x = VelocityX;
			velocity.y = VelocityY// - 1000*Math.random();
		 
				
			play("yellow1")
		}
		
		public function get damage():Number
		{
			return this._damage
		}
		public function get level():Number
		{
			return this._level
		}
		
	}
}