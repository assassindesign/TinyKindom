package
{
	import org.flixel.FlxButton;
	
	public class StateBtn extends FlxButton
	{
		[Embed(source="data/lock.png")]public var lockPNG:Class;
		
		
		private var _level:uint
		private var _lock:Boolean
		public function StateBtn(X:Number=0, Y:Number=0, LOCK:Boolean = true, LEVEL:uint, OnClick:Function=null)
		{
			super(X, Y, null, OnClick);
		    this._level = LEVEL;
			this._lock = LOCK
			if(this._lock)
			{
				this.loadGraphic(
			}else
			{
			this.loadGraphic(
				
			}
		}
		
		
	}
}