package
{
 
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	
	public class EffectG extends FlxGroup
	{
		private var _e1:Effect1
		private var _e2:Effect2
		private var _e1Group:FlxGroup
		private var _e2Group:FlxGroup
		private var _e3Timer:Number = 0
		private var _e3killTime:Number = 0.6
		private var _e3:FlxBitmapFont;
		[Embed(source="data/bmfont.png")] public var numPNG:Class;
		[Embed(source="data/buy.mp3")]private var buyMP3:Class
		
		public function EffectG()
		{
			super(3);
			_e1Group = new FlxGroup(3)
			_e2Group = new FlxGroup(3)
			this.add(_e1Group);
			this.add(_e2Group);
			
			_e3 = new FlxBitmapFont(numPNG,16,16,"-0123456789",11)
			_e3.kill()
		    _e3.scrollFactor.x = _e3.scrollFactor.y = 0
			this.add(_e3)
		}
	
		
		override public function update():void
		{
			super.update()
			if(_e3.exists)
			{
				this._e3Timer+= FlxG.elapsed
				this._e3.velocity.y = -30
				if(this._e3Timer>=this._e3killTime)
				{
					_e3.kill()
					_e3Timer = 0
				}
				
			}
		}
		
		/**
		 * show money spent
		 */
		public function e3(X:Number,Y:Number,TXT:String):void
		{
//			trace(this.buyMP3)
			FlxG.play(this.buyMP3);
			_e3.text = TXT
			_e3.reset(X,Y);
		}
		
		public function e2(X:Number,Y:Number):void
		{
			_e2 =  this._e2Group.recycle(Effect2) as Effect2
            _e2.show(X,Y);		
		}
		
 
		public function e1(X:Number,Y:Number):void
		{
		   _e1 = this._e1Group.recycle(Effect1) as Effect1
		   _e1.show(X,Y)
		
		}
		
		
	}
}