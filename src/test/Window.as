package test
{
 
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class Window extends FlxGroup
	{
		
		public var createSoliderButton1:FlxButton
		public var createSoliderButton2:FlxButton
		public var createSoliderButton3:FlxButton
		
		public var closeBtn:FlxButton 
		
		[Embed(source = 'data/s1btn.png')]public var btn2PNG:Class;
		
		public static var SHOW:Boolean = false
		
		
		public function Window(MaxSize:uint=0)
		{
			
            super()
			 
			this.createSoliderButton1 = new FlxButton(10,10,null,onUpgrade1)		
			this.createSoliderButton1.scrollFactor.x = this.createSoliderButton1.scrollFactor.y = 0
			this.add(this.createSoliderButton1)
			var t1:FlxText = new FlxText(55,20,FlxG.width-40,"50金币升级建造初级士兵能力,之后每创建耗费25金币",false)
			t1.size = 16
			this.add(t1)	
			

				
			this.createSoliderButton2 = new FlxButton(10,60,null,onUpgrade2)
			this.createSoliderButton2.makeGraphic(40,40,0x33ffffff); 
			this.createSoliderButton2.scrollFactor.x = this.createSoliderButton2.scrollFactor.y = 0
			this.createSoliderButton2.active =false
			this.add(this.createSoliderButton2)
				
			/*var t2:FlxText = new FlxText(55,70,FlxG.width-40,"25金币升级快速打击初级士兵能力,之后每个耗费25金币",false)
			t2.size = 16
			this.add(t2)		*/
				
			//this.add(new FlxText(55,70,FlxG.width-40,"建造初级士兵的能力",false))	
				
			this.createSoliderButton3 = new FlxButton(10,110,"建造士兵3",onUpgrade3)
			this.createSoliderButton3.makeGraphic(40,40,0x33ffffff); 
			this.createSoliderButton3.active =false
			this.createSoliderButton3.scrollFactor.x = this.createSoliderButton3.scrollFactor.y = 0
			this.add(this.createSoliderButton3)
			//this.add(new FlxText(55,120,FlxG.width-40,"建造初级士兵的能力",false))	
		

			switch(Registry.currentLevel)
			{
				
				case 1:
					this.createSoliderButton1.loadGraphic(btn2PNG)
					this.createSoliderButton2.loadGraphic(btn2PNG)
					this.createSoliderButton2.active = true
					
					break;
				
				case 2:
					
					break;
				
				
			}
		 
			
			
			
			this.closeBtn = new FlxButton(FlxG.width - 80 , 0 ,"X",onClose) // new FlxButtonPlus( FlxG.width- 80,0,onClose,null,"X",80,30) // FlxButton(FlxG.width-80,0,"X",onClose)	 			
//			this.closeBtn.pauseProof = true
			this.add(this.closeBtn)
			
 
		}
		
		
		override public function update():void
		{  
//			trace("Window.update" ,SHOW , this.exists)
		  
			super.update()
		}
		
		private function onClose():void
		{
			if(!Window.SHOW)return
			Window.SHOW = false
			trace("onClose",this.closeBtn.exists)
//			this.exists = false
		}
		private function onUpgrade1():void
		{
		    trace("onUpgrade1")
			this.onClose()
		}
		private function onUpgrade2():void
		{
			trace("onUpgrade2")
			this.onClose()
		}
		private function onUpgrade3():void
		{
			if(!PlayState(FlxG.state).showUpgradeWindow )return
			if(PlayState(FlxG.state).cbtn3.exists || FlxG.scores[0]< 40)return
			PlayState(FlxG.state).addCDButton(  PlayState(FlxG.state).cbtn3 )			 
			this.onClose()
		}
		 
		override public function destroy():void
		{
		    
			
			this.closeBtn.destroy()
			this.createSoliderButton1.destroy()
			this.createSoliderButton2.destroy()
			this.createSoliderButton3.destroy()
			super.destroy()
		}
	}
}