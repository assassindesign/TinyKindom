package test
{
	import org.flixel.*;
	
	public class Bug2 extends FlxState
	{
		public function Bug2()
		{
			super();
		}
		
		override public function create():void
		{
			super.create()
			this.add( new FlxButton(100,100,"TESTTESTTEST",onClick))
		}
		
		override public function update():void
		{
			if(FlxG.paused)return
				super.update()
			
		}
		
		private function onClick():void
		{
			//if(FlxG.paused)return
			FlxG.paused = true
			trace("what's wrong Huh?Huh???")
		}
	}
}