package test
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class Bug extends FlxState
	{
		public function Bug()
		{
			super();
			
			
		}
		
//		private var btn:FlxButtonPlus = new FlxButtonPlus(100,100,onClick,null,"Upgrade!!!") //new FlxButton(100,100,"TESTTESTTEST",onClick)
 
			
			
//		
		
		private var btn:FlxButton 
		private var _up:Window
	 
		override public function create():void
		{   
//			FlxG.mouse.show()
			super.create()
		    btn = new FlxButton(100,100,"test",onClick);
			this.add( btn)
			
		    _up = new Window()
				
		}
		
		/*override public function preUpdate():void
		{
			if(FlxG.paused)return this._up.preUpdate()
			super.preUpdate()
		}
	
		override public function postUpdate():void
		{
			if(FlxG.paused)return this._up.postUpdate()
			super.postUpdate()
		}*/
		
		override public function update():void
		{
//			trace("update",Window.SHOW)
			if(Window.SHOW)
			{
				this._up.update()
				return 
			}
			
			
			super.update()
		}
		
		override public function draw():void
		{
			if(Window.SHOW)return this._up.draw()
				
			super.draw()
		}
		private function onClick():void
		{
			if(Window.SHOW)return
             trace("onClick;",Window.SHOW)
			 Window.SHOW = true
			 
//			 this._up.exists = true
			 
			 trace("onClick;",Window.SHOW)
		}
	}
}