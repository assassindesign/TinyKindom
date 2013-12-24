package
{
	import org.flixel.FlxSprite;
	
	public class Effect1 extends FlxSprite
	{
		
		[Embed(source="data/effect1.png")]public var Effect1PNG:Class
		public function Effect1(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			this.loadGraphic(this.Effect1PNG,true,false,10,50)
			this.addAnimation("show",[0,1,2],5,false);
		}
		override public function update():void
		{
			if(this.finished)this.exists =false 
		}
		public function show(X:Number,Y:Number):void
		{
		 
			this.x = X -this.width*.5
			this.y = Y ;
			this.exists =true
			this.play("show")
		}
	}
}