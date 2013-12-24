package
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class PassState extends FlxState
	{
		public function PassState()
		{
			super();
		    var t:FlxText = new FlxText(FlxG.width*.5 - 155 ,60,300,"GAME OVER")
			t.size =40
			add(t);
			
			var t2:FlxText = new FlxText(FlxG.width*.5 - 100 ,FlxG.height-60,300,"Touch Screen to Restart")
				t2.flicker(99999)
				t2.size = 14
			add (t2)
		}
		
		override public function update():void
		{
			super.update()
			if(FlxG.mouse.justReleased())
			{
				FlxG.fade(0xff03608c,0.5,onSwitch);
				
			}
		}
		
		private function onSwitch():void
		{
			
			FlxG.switchState(new MenuState);
			
		}
		override public function destroy():void
		{
			super.destroy()
			
		}
	}
}