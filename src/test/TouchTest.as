package test
{
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class TouchTest extends FlxState
	{
		
		private var txt1:FlxText = new FlxText(0,0,480,null,true)
		private var txt2:FlxText = new FlxText(0,40,480,null,true)
		private var txt3:FlxText = new FlxText(0,80,480,null,true)
		private var txt4:FlxText = new FlxText(0,120,480,null,true)
		private var txt5:FlxText = new FlxText(0,160,480,null,true)
		private var txt6:FlxText = new FlxText(0,200,480,null,true)
		public function TouchTest()
		{
			super();
		}
		
		override public function create():void
		{
			
			
			txt1.size = txt2.size = txt3.size =txt4.size =txt5.size = txt6.size = 16
			this.add(txt1)
			this.add(txt2)
			this.add(txt3)
			this.add(txt4)
			this.add(txt5)
			this.add(txt6)
				

 
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				
			FlxG.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin); 
			FlxG.stage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			FlxG.stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
			FlxG.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseBegin);
			FlxG.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			FlxG.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseEnd);
	
		}
		
		private var b1:Boolean = false
		private var b2:Boolean = false
			
		private var startMouseX:Number = 0  
		private var startTouchX:Number  = 0
		
		private function onMouseBegin(evt:MouseEvent):void {         
			txt1.text =  "onMouseBegin  " + FlxG.mouse.x + "    "+FlxG.mouse.screenX
			txt3.text = ""
			b1=true
			startMouseX = FlxG.mouse.x
		} 
		private function onMouseMove(evt:MouseEvent):void { 
			
			txt1.text =  "onMouseMove" + FlxG.mouse.x + "    "+FlxG.mouse.screenX
			if(this.startMouseX>1000)this.startMouseX = FlxG.mouse.x
			if(b1)
			{
				txt3.text = "mouse move    " + b1
			}
		} 
		private function onMouseEnd(evt:MouseEvent):void { 
			
			txt1.text = "onMouseEnd"  + FlxG.mouse.x + "    "+FlxG.mouse.screenX
			txt3.text = ""
            b1 = false
			
			txt5.text = "mouse x move:  "+ (FlxG.mouse.x - startMouseX)
		} 
		
		private function onTouchBegin(evt:TouchEvent):void { 
			txt2.text = "onTouchBegin x:" + FlxG.mouse.x + "    "+FlxG.mouse.screenX
			b2 = true
			txt4.text = ""
			this.startTouchX = FlxG.mouse.x
		} 
		
		private function onTouchMove(evt:TouchEvent):void { 
			txt2.text = "onTouchMove"
			if(b2)txt4.text = "touch move   " +b2
		} 
		
		private function onTouchEnd(evt:TouchEvent):void { 
			txt2.text = "onTouchEnd" + FlxG.mouse.x + "    "+FlxG.mouse.screenX
			b2 = false
			txt4.text = ""
            txt6.text = "touch x move:  "+ (FlxG.mouse.x -this.startTouchX)
		}
		
		
	}
}