package
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import org.flixel.*;
	
	[SWF(width="480", height="320",  backgroundColor="#000000")]
	public class TinyKindom extends FlxGame
	{
		public function TinyKindom()
		{
			super(480,320,MenuState,1);
			FlxG.mobile = true
			FlxG.debug = false
			
		}
		
		override protected function create(FlashEvent:Event):void
		{
			super.create(FlashEvent)
			stage.scaleMode = StageScaleMode.EXACT_FIT;
		}
		
	}
}