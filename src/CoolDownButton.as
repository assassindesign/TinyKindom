package
{
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import org.flixel.FlxButton;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	
	public class CoolDownButton extends FlxButton
	{
		
		private var _shape:Shape = new Shape()
		private var _time:Number
		private var _timePast:Number = 0
		public function CoolDownButton(X:Number=0, Y:Number=0, Label:String=null, OnClick:Function=null,Time:Number = 4)
		{
			super(X, Y, Label, OnClick);
		    this._time = Time
			this._timePast = this._time +1
			this._shape.x = X
			this._shape.y = Y

		}
		private var arrX:Array 
		private var arrY:Array 
		override public function update():void
		{
			this._timePast+=FlxG.elapsed
			super.update()
			if(this._timePast>=this._time)
			{
				
				return
			}
			var startPos:Number = (this.width*2+this.height*2  )* (this._timePast/this._time) //+ this.width/2
			if(startPos<this.width/2)
			{   //上
				arrX= [startPos+this.width/2, this.width , this.width  ,0            , 0,this.width/2,this.width/2]
				arrY= [   0     , 0         , this.height , this.height , 0,0           ,this.height/2]
			}else if(startPos<(this.height+this.width/2))
			{
				//右
				
				arrX= [this.width                  ,  this.width  ,0            , 0,this.width/2,this.width/2]
				arrY= [  startPos-this.width/2     , this.height , this.height , 0,0           ,this.height/2]
			}else if(startPos<(this.height+this.width/2+this.width))
			{
				//下
				arrX= [this.width-(startPos - this.height-this.width/2),  0, 0,this.width/2,this.width/2]
				arrY= [   this.height                     ,  this.height , 0,0           ,this.height/2]
			}else if(startPos<(this.width/2+this.height*2 +this.width ))
			{
				//左
				 
				arrX= [0                                                   ,    0,this.width/2,this.width/2]
				arrY= [ this.height-(startPos- this.width-this.height - this.width/2)     ,   0,0           ,this.height/2]
				
			}else
			{
				arrX= [startPos -this.width - this.height*2 - this.width/2  ,     this.width/2,this.width/2]
				arrY= [ 0                                                   ,   0           ,this.height/2]
			}
			
		 
		}
		
		
		override protected function onMouseUp(event:MouseEvent):void
		{
			if(this._timePast<this._time || !exists || !visible || !active || (status != PRESSED))return
		 
			if(onUp != null)
				if(onUp())this._timePast=0;
			if(soundUp != null)
				soundUp.play(true);
		 
			
		}
		
		override public function draw():void
		{
			
			super.draw()
		    if(this._timePast>=this._time)return
				
			this._shape.graphics.clear()	
			this._shape.graphics.beginFill(0,0.5)
			this._shape.graphics.moveTo(this.width/2,this.height/2)
			var len:int = arrX.length
			for(var n:int  = 0 ; n< len; n++)
			{
				this._shape.graphics.lineTo(arrX[n],arrY[n])
			}
			/*this._shape.graphics.lineTo(this.width,0)
			this._shape.graphics.lineTo(this.width,this.height)
			this._shape.graphics.lineTo(0,this.height)
			this._shape.graphics.lineTo(0,0)
			this._shape.graphics.lineTo(this.width/2,0)
			this._shape.graphics.lineTo(this.width/2,this.height/2)*/
			this._shape.graphics.endFill()	
				
			if(cameras == null)
				cameras = FlxG.cameras;
			var camera:FlxCamera;
			var i:uint = 0;
			var l:uint = cameras.length;
			while(i < l)
			{
				camera = cameras[i++];
				if(!onScreen(camera))
					continue;
				_point.x = x - int(camera.scroll.x*scrollFactor.x) - offset.x;
				_point.y = y - int(camera.scroll.y*scrollFactor.y) - offset.y;
				_point.x += (_point.x > 0)?0.0000001:-0.0000001;
				_point.y += (_point.y > 0)?0.0000001:-0.0000001;
			    _matrix.identity();
                _matrix.translate(_point.x,_point.y);
				camera.buffer.draw(this._shape,this._matrix) 
			 
			}
		}
	}
}