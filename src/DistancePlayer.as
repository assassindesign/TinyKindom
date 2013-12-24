package
{
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBar;

	public class DistancePlayer  extends FlxSprite
	{
		
		[Embed(source='data/helmutguy.png')]public var Helmutguy:Class;
		
		protected static const RUN_SPEED:int = 80;
		protected static const GRAVITY:int =420;
		protected static const JUMP_SPEED:int = 300;
		
		private var _target:FlxSprite;
		
		public function DistancePlayer(X:int=0,Y:int=0):void 
		{
			
			super(X, Y);
			this.health = 100
			loadGraphic(Helmutguy,true,true);  //Set up the graphics
			addAnimation("walking", [1, 2], 12, true);
			addAnimation("idle", [0]);
 
			acceleration.y = GRAVITY;
			maxVelocity.x = RUN_SPEED;
		     
		}
	}
}