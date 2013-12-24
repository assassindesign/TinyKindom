package
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	
	public class ShootBullet extends FlxSprite
	{
		[Embed(source="data/bot_bullet.png")] private var ImgBullet:Class;
		
		public function ShootBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(ImgBullet,true);
			addAnimation("idle",[0, 1], 50);
			addAnimation("poof",[2, 3, 4], 50, false);
		}
		
	/*	override public function update():void
		{
			
		}
		*/
		public function shoot(Location:FlxPoint,speed:FlxPoint):void
		{
			play("idle");
			
			super.reset(Location.x+this.width,Location.y+this.height);
		
			this.acceleration.x = speed.x;
			acceleration.y = speed.y;
			solid = true;
			
			FlxG.log(this.velocity.x +"  "+this.velocity.y);
		}
		
	}
}