package test
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	
	public class ShootTest extends FlxState
	{
		private var n:FlxSprite
		private var s:FlxSprite
		public function ShootTest()
		{
			super();
			s = new FlxSprite()
			s.makeGraphic(5,5,0xffff0000)
			s.x = s.y = 100
			this.add(s);
			s.velocity.x  = 200
			n = new FlxSprite()
			n.makeGraphic(5,5,0xff00ff00);
			this.add(n)
			
		}
		
		override public function update():void
		{ 
			 super.update()
			//			trace(FlxU.getAngle(s.getMidpoint(),n.getMidpoint())  , angleBetween(s,n)  );
//			s.velocity.x = 1000
			n.x = FlxG.mouse.x
			n.y = FlxG.mouse.y
			
			
			var p:FlxPoint = FlxU.rotatePoint(0,100,0,0,FlxU.getAngle(s.getMidpoint(),n.getMidpoint()));
			
			
			
						s.velocity.x= p.x;
						s.velocity.y= p.y;
			
			trace(s.velocity.x,s.velocity.y,s.x,s.maxVelocity.x)
		}
		
		public function angleBetween(a:FlxSprite, b:FlxSprite, asDegrees:Boolean = true):Number
		{
			var dx:Number = (b.x + b.origin.x) - (a.x + a.origin.x);
			var dy:Number = (b.y + b.origin.y) - (a.y + a.origin.y);
			
			if (asDegrees)
			{
				return  (Math.atan2(dy, dx)*180/Math.PI );
			}
			else
			{
				return Math.atan2(dy, dx);
			}
		}
	}
}