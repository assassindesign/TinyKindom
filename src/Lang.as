package
{
	public class Lang
	{
		
	   /*
	  点击屏幕开始游戏选择关卡来放置物品攻城者研究生产个空袭敌人即将创建去战斗吧太多了你需要一帮忙对能解决掉所有的注意时机保护想重新这只右上角按钮跳跃装助到达高处防左侧堡进行升级然后占领方0123456789/,.!，．()
	  */
		
		[Embed(source="c:/windows/fonts/msyh.ttf", fontName="wryh", fontStyle="normal", fontWeight="normal", embedAsCFF="false", advancedAntiAliasing="false", 
unicodeRange="U+70b9,U+51fb,U+5c4f,U+5e55,U+5f00,U+59cb,U+6e38,U+620f,U+9009,U+62e9,U+5173,U+5361,U+6765,U+653e,U+7f6e,U+7269,U+54c1,U+653b,U+57ce,U+8005,U+7814,U+7a76,U+751f,U+4ea7,U+4e2a,U+7a7a,U+88ad,U+654c,U+4eba,U+5373,U+5c06,U+521b,U+5efa,U+53bb,U+6218,U+6597,U+5427,U+592a,U+591a,U+4e86,U+4f60,U+9700,U+8981,U+4e00,U+5e2e,U+5fd9,U+5bf9,U+80fd,U+89e3,U+51b3,U+6389,U+6240,U+6709,U+7684,U+6ce8,U+610f,U+65f6,U+673a,U+4fdd,U+62a4,U+60f3,U+91cd,U+65b0,U+8fd9,U+53ea,U+53f3,U+4e0a,U+89d2,U+6309,U+94ae,U+8df3,U+8dc3,U+88c5,U+52a9,U+5230,U+8fbe,U+9ad8,U+5904,U+9632,U+5de6,U+4fa7,U+5821,U+8fdb,U+884c,U+5347,U+7ea7,U+7136,U+540e,U+5360,U+9886,U+65b9,U+30,U+31,U+32,U+33,U+34,U+35,U+36,U+37,U+38,U+39,U+28,U+29,U+2f,U+2c,U+2e,U+21,U+ff0c,U+ff0e", 
mimeType="application/x-font")]
		public var MyFont : Class;
		public static var YaHei:String = "wryh"
		
		public static const CHINESE:uint = 1
		public static const ENGLIST:uint = 0
		public static var currentLang:uint = 1
			

	    public static const CLICK_TO_START:Array  = ["TOUCH  SCREEN  TO  START","点 击 屏 幕 开 始 游 戏"]
		public static const SELECT_LEVEL:Array = ["Select Level","选 择 关 卡"] 
		public static const PLACE_ITEM:Array = ["Touch to place the item","点击屏幕来放置物品"]	
			
		public static const SIEGER:Array = ["Sieger","攻城者 ：研究50 ，生产25/个"]
		public static const AIRRAIDER:Array = ["Airraider","空袭者 ：研究30，生产25/个"]
		public static const ANTI_AIRCRAFT:Array = ["Anti-aircraft","对空者 ：研究40，生产25/个"]
			
		public static const TIP1:Array  = ["Touch the left castle to upgrade, then create sieger to occupy the enemy castle.","点击左侧城堡进行升级，创建攻城者占领敌方城堡．"]
		public static const TIP2:Array  = ["Enemy is coming, create sieger to fight !!!","敌人即将来袭，创建攻城者去战斗吧！！！"]	
		public static const TIP3:Array  = ["Too many soldiers!!! You need a airraider to help."  ,"太多敌人了！！！你需要一个空袭者来帮忙．"]	
		public static const TIP4:Array  = ["Anti-aircraft can kill all Airraiders, protect sieger note the timing."  ,"对空者能解决掉所有空袭者，注意时机，保护攻城者．"]		
		public static const TIP5:Array  = ["To restart this level just touch the button on the top right of the screen."  ,"想要重新开始这个关卡只需要点击屏幕右上角的按钮．"]				
		public static const TIP6:Array  = ["You need a jump device to get higher."  ,"你需要一个跳跃装置帮助你到达高处．"]	
			
		
	}
}