package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	
	import org.flixel.*;
	import test.*
//	import test.*;

	[SWF(width="480", height="320",  backgroundColor="#000000")]
//	[SWF(width="320", height="480",  backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	public class PlatformTest extends FlxGame
	{
		public function PlatformTest()
		{
 
			
		
//			super(480,320 ,TouchTest ,1)
			super(480,320,MenuState,1);
			FlxG.mobile = true
			FlxG.debug = false
//			super(480,320,Bug2,1);
//			super(240,160,PlayState,2);
			FlxG.visualDebug = true
			//FlxG.mouse.show();
		}
		
		/*override protected function update():void
		{
			if(FlxG.paused)return
				
			super.update()
		}*/
     
	}
}
