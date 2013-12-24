package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class MenuState extends FlxState
	{
		[Embed(source="data/mainScreen.png")]private var mainScreenPNG:Class;
		[Embed(source="data/bg.mp3")]private var bgMusic:Class;
		
		
	
		
		override public function create():void
		{
			
			var bg:FlxSprite= new FlxSprite(0,0,mainScreenPNG);
			this.add(bg);
			
			
			var t2:FlxText = new FlxText(0 ,FlxG.height-30,FlxG.width,Lang.CLICK_TO_START[Lang.currentLang])
			t2.alignment = "center"
			
			if(Lang.currentLang == Lang.CHINESE)t2.setFormat(Lang.YaHei,14)
			t2.flicker(99999)
			t2.size = 14
			add (t2)
//			FlxG.playMusic(this.bgMusic);
			
			if(FlxG.music == null)
				FlxG.music = new FlxSound();
			else if(FlxG.music.active)
				FlxG.music.stop();
			
			FlxG.music.loadEmbedded(bgMusic,true);
			FlxG.music.volume = 1;
			FlxG.music.survive = true;
			FlxG.music.fadeIn(1)
			
		}
		
		override public function update():void
		{
			super.update()
			if(FlxG.mouse.justReleased())
			{
//				FlxG.flash(0xffffffff,3,onSwitch)
//				FlxG.flash(0xff03608c,0.5);
				FlxG.fade(0xff03608c,0.5,onSwitch);
				
			}
		}
		
		private function onSwitch():void
		{
			 
			FlxG.switchState(new LevelState);
			
		}
	}
}