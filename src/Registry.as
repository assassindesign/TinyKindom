package    
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxTilemap;
	 
	public class Registry 
	{
		public static var playerGroup1:FlxGroup
		public static var flyPlayerGroup1:FlxGroup;
		public static var shootPlayerGroup1:FlxGroup
//		public static var bulletsGroup1:FlxGroup;
		
		
		public static var playerGroup2:FlxGroup
		public static var flyPlayerGroup2:FlxGroup
		public static var shootPlayerGroup2:FlxGroup
//		public static var bulletsGroup2:FlxGroup;
		
		
		public static var currentLevelData:LEVEL  
		public static var map:FlxTilemap
		public static var effectG:EffectG	
			
		
		public static var tileMap:FlxTilemap
		
		public function Registry() 
		{
			
		}
		
	}

}