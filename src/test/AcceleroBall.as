package test
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.sensors.Accelerometer;
	
	public class AcceleroBall extends Sprite
	{
		[Embed(source="data/bee.png")]
		private var sphereClass:Class;
		
		private var _sphere			:Bitmap;
		private var _factor			:uint			= 50;
		
		private var _accelerometer		:Accelerometer;
		private var _targetX			:Number;
		private var _targetY			:Number;
		
		public function AcceleroBall()
		{
			setup();
		}
		
		protected function setup():void
		{
			if ( Accelerometer.isSupported )
			{
				_accelerometer = new Accelerometer();
				_accelerometer.addEventListener( AccelerometerEvent.UPDATE, onAccelUpdate );
				
				_sphere = new sphereClass();
				_sphere.scaleX = _sphere.scaleY = .2;
				addChild( _sphere );
				
				addEventListener(Event.ENTER_FRAME, moveSphere );
			}
			else
			{
				//display message to user that accelerometer is not available
			}
		}
		
		protected function onAccelUpdate( event:AccelerometerEvent ):void
		{
			_targetX = event.accelerationX * _factor;
			_targetY = event.accelerationY * _factor;
		}
		
		protected function moveSphere(event:Event):void
		{
			_sphere.x -= _targetX;
			_sphere.y += _targetY;
		}
	}
}