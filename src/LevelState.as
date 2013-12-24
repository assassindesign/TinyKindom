package
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class LevelState extends FlxState
	{
		[Embed(source="data/lock.png")]public var lockPNG:Class
		[Embed(source="data/unlock.png")]public var unlockPNG:Class
		
		private var startX:uint = (FlxG.width-270)/2
		private var startY:uint = 100
	 
		public function LevelState()
		{
			super();

		};
		
		override public function create():void
		{
			FlxG.flash(0xff03608c,0.5);
//			trace(Lang.SELECT_LEVEL[Lang.currentLang])
			var title:FlxText = new FlxText(0,30,FlxG.width,Lang.SELECT_LEVEL[Lang.currentLang],true);
			title.alignment = "center"
			if(Lang.currentLang == Lang.CHINESE)title.setFormat(Lang.YaHei)
			title.size = 25		
			
			this.add(title);
			
			var sp:FlxSprite = new FlxSprite(0,0,this.unlockPNG);
			var sp2:FlxSprite = new FlxSprite(0,0,this.lockPNG);
			var b:FlxButtonPlus
			for(var i:uint=0 ; i< 20 ;i++)
			{
				if(i>=LEVEL.currentLevel)
				{
					
					this.add(new FlxSprite(startX+i%5 *60,startY+int(i/5)*45,this.lockPNG))
					
				}else
				{
					b = new FlxButtonPlus(startX+i%5 *60,startY+int(i/5)*45, onSelect, [i+1],(i+1).toString(),32,32)
					b.textNormal.size =b.textHighlight.size = 18
					
					//				   var b:FlxButton = new FlxButton(,null,onSelect)
					//				   b.loadGraphic(sp,sp);
					this.add(b);
				}
			}
		}
		
		private function onSelect(p:uint):void
		{
			LEVEL.currentLevel = p
			Registry.currentLevelData = new LEVEL( );
			FlxG.fade(0xff03608c,0.5,onSwitch);
			FlxG.music.fadeOut(0.5)
		}
		private function onSwitch():void
		{
			
			
			FlxG.switchState(new PlayState())
		}
	}
}