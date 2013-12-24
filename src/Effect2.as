package
{
	import org.flixel.FlxSprite;
	
	public class Effect2 extends FlxSprite
	{
		[Embed(source="data/effect2.png")]public var Effect2PNG:Class
		public function Effect2(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			this.loadGraphic(this.Effect2PNG,true,false,8,8)
			this.addAnimation("show",[0,1,2,3],5,false);
		}
		override public function update():void
		{
			if(this.finished)this.exists =false 
		}
		public function show(X:Number,Y:Number):void
		{
			
			this.x = X -this.width*.5
			this.y = Y -this.height*.5;
			this.exists =true
			this.play("show")
		}
	}
}