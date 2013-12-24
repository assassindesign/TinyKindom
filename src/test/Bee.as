package test
{

	import flash.display.BitmapData;
	import flash.events.AccelerometerEvent;
	import flash.sensors.Accelerometer;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Bee extends FlxSprite
	{
		 
		private var _accX:Number
		private var _accY:Number
		[Embed(source="/data/bee.png")]private var IMG_BEE:Class;
		
		private var _Acc:Accelerometer = new Accelerometer()
	    public function Bee( ):void
		{
			  
				super(FlxG.width/2,FlxG.height/2);
				
				this.loadGraphic(IMG_BEE,true,false,48,35)
				this.addAnimation("fly",[0,1,2,3],24);
//			    trace(this.width)
				
				if(Accelerometer.isSupported)
				{
					this.play("fly");
					_Acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate);
				}
				
		}
		
		private function onAccUpdate(evt:AccelerometerEvent):void{
			
			this.velocity.x = -evt.accelerationX * 500
			this.velocity.y = evt.accelerationY * 500
//			_accX = evt.accelerationX * 80
//			_accY = evt.accelerationY * 80
			//			_accZ =  Math.floor(evt.accelerationZ * 20)
			
//			this.t1.text = evt.accelerationX.toString()+"   "+evt.accelerationZ.toString()+ "  "+this._accX.toString()+"   "+this._accZ.toString();
		}
	
		override public function update():void
		{
			super.update()
			
			if(this.x>FlxG.width)this.x= -this.width
			else if(this.x<-this.width)this.x=FlxG.width
				
			if(this.y>FlxG.height)this.y = -this.height
			else if(this.y<-this.height)this.y=FlxG.height;
			
			
			if(Accelerometer.isSupported)
			{
//				this.velocity.x =  this._accX 
//				TestState(FlxG.state).t2.text = "accX: "+this._accX.toString() + " this.velocity.x: "+this.velocity.x.toString();
			}else
			{
				this.velocity.x = 200
			}
				
//			this.x -= this._accX
//			this.velocity.y = this._accY
			
		}
	 
	}
}