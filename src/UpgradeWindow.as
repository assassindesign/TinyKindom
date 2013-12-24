package
{
 
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class UpgradeWindow extends FlxGroup
	{
		
		public var createSoliderButton1:FlxButton
		public var createSoliderButton2:FlxButton
		public var createSoliderButton3:FlxButton
		public var mg1:FlxButton;
		
		public var closeBtn:FlxButton
		
		[Embed(source = 'data/e1btn.png')]public var btn1PNG:Class;
		[Embed(source = 'data/e2btn.png')]public var btn2PNG:Class;
		[Embed(source = 'data/e3btn.png')]public var btn3PNG:Class;
		[Embed(source = 'data/close.png')]public var closePNG:Class;
		
		private var t1:FlxText;
		private var t2:FlxText;
		private var t3:FlxText
		
		
		private var moneyTip:FlxText =new FlxText(120,150,340,"No enough money !")
		
		public function UpgradeWindow(MaxSize:uint=0)
		{
			

			 //button1 always display
			this.createSoliderButton1 = new FlxButton(10,10,null,onUpgrade1)		
			this.createSoliderButton1.scrollFactor.x = this.createSoliderButton1.scrollFactor.y = 0
			this.createSoliderButton1.loadGraphic(btn1PNG)
			this.add(this.createSoliderButton1)
			t1 = new FlxText(55,15,FlxG.width-40,Lang.SIEGER[Lang.currentLang])
			if(Lang.currentLang ==Lang.CHINESE)t1.setFormat(Lang.YaHei);
			t1.size = 16
			t1.scrollFactor.x = t1.scrollFactor.y = 0	
			this.add(t1)	
			

				
			this.createSoliderButton2 = new FlxButton(10,60,null,onUpgrade2)
			this.createSoliderButton2.makeGraphic(40,40,0x33ffffff); 
			this.createSoliderButton2.scrollFactor.x = this.createSoliderButton2.scrollFactor.y = 0
			this.createSoliderButton2.active =false
			this.add(this.createSoliderButton2)
				
			t2 = new FlxText(55,65,FlxG.width-40,Lang.AIRRAIDER[Lang.currentLang])
			if(Lang.currentLang ==Lang.CHINESE)t2.setFormat(Lang.YaHei);
			t2.size = 16
			t2.scrollFactor.x = t2.scrollFactor.y = 0	
			t2.exists =false
			this.add(t2)		
				
			//this.add(new FlxText(55,70,FlxG.width-40,"建造初级士兵的能力",false))	
				
			this.createSoliderButton3 = new FlxButton(10,110,null,onUpgrade3)
			this.createSoliderButton3.makeGraphic(40,40,0x33ffffff); 
			this.createSoliderButton3.active =false
			this.createSoliderButton3.scrollFactor.x = this.createSoliderButton3.scrollFactor.y = 0
			this.add(this.createSoliderButton3)
				
			t3 = new FlxText(55,115,FlxG.width-40,Lang.ANTI_AIRCRAFT[Lang.currentLang])
			if(Lang.currentLang ==Lang.CHINESE)t3.setFormat(Lang.YaHei);
			t3.size = 16
			t3.exists =false
			t3.scrollFactor.x = t3.scrollFactor.y = 0	
			this.add(t3)			
				
				
			//this.add(new FlxText(55,120,FlxG.width-40,"建造初级士兵的能力",false))	
		
			//跳跃
			this.mg1 = new FlxButton(10,160,null,onUpgrade4)
			this.mg1.makeGraphic(40,40,0x33ffffff); 
			this.mg1.active =false
			this.mg1.scrollFactor.x = this.mg1.scrollFactor.y = 0
			this.add(this.mg1)
			
			this.moneyTip.exists = false
			this.moneyTip.size = 16
			this.add(this.moneyTip);
			switch(LEVEL.currentLevel)
			{
				
				case 1:
					
			
					
				break;
				
				case 2:
					
//					this.createSoliderButton3.loadGraphic(btn1PNG)
//					this.createSoliderButton3.active = true
				break;
				
				
				case 3:
					this.createSoliderButton2.loadGraphic(btn2PNG)
					this.createSoliderButton2.active = true
					this.t2.exists = true
					
					
					
					break;
				
				
				case 4:
					
					this.createSoliderButton2.loadGraphic(btn2PNG)
					this.createSoliderButton2.active = true
					this.createSoliderButton3.loadGraphic(btn3PNG)
					this.createSoliderButton3.active = true
					this.t2.exists = true
					this.t3.exists = true
					
					
				break;
				
				case 5:
					this.createSoliderButton2.loadGraphic(btn2PNG)
					this.createSoliderButton2.active = true
					this.createSoliderButton3.loadGraphic(btn3PNG)
					this.createSoliderButton3.active = true
					this.t2.exists = true
					this.t3.exists = true
					
				break;
				
				case 6:
					this.createSoliderButton2.loadGraphic(btn2PNG)
					this.createSoliderButton2.active = true
					this.createSoliderButton3.loadGraphic(btn3PNG)
					this.createSoliderButton3.active = true
					this.t2.exists = true
					this.t3.exists = true
					this.mg1.loadGraphic(btn3PNG)
                    this.mg1.active = true				
				default:
					this.createSoliderButton2.loadGraphic(btn2PNG)
					this.createSoliderButton2.active = true
					this.createSoliderButton3.loadGraphic(btn3PNG)
					this.createSoliderButton3.active = true
					this.mg1.loadGraphic(btn3PNG)
					this.mg1.active = true		
					this.t2.exists = true
					this.t3.exists = true
				break;	
				
				
			}
		 
			
			
//			this.closeBtn = new FlxButtonPlus( FlxG.width- 80,0,onClose,null,"X",80,30) // FlxButton(FlxG.width-80,0,"X",onClose)	 			
//			this.add(this.closeBtn)
			this.closeBtn = new FlxButton(FlxG.width - 50 , 10 ,null,onClose) // new FlxButtonPlus( FlxG.width- 80,0,onClose,null,"X",80,30) // FlxButton(FlxG.width-80,0,"X",onClose)	 			
			//			this.closeBtn.pauseProof = true
			this.closeBtn.loadGraphic(closePNG)
			this.closeBtn.scrollFactor.x = this.closeBtn.scrollFactor.y = 0
				
			this.add(this.closeBtn)
 
		}
		
		
		override public function update():void
		{  
//			PlayState.showUpgradeWindow , this.exists)
//			if(!PlayState(FlxG.state).showUpgradeWindow )return
				
//			this.createSoliderButton1.y+=10
			super.update()
		}
		
		private function onClose():void
		{
//			trace("upgradeWindows.onClose",PlayState.showUpgradeWindow)
			
			PlayState.showUpgradeWindow = false
//			createSoliderButton3.visible =false
//			FlxG.paused = false //临时做法,有bug
			this.visible =false
			moneyTip.exists = false
//			this.exists = false
		}
		private function onUpgrade1():void
		{
//			if(!PlayState(FlxG.state).showUpgradeWindow  )return
			if(PlayState(FlxG.state).cbtn1.exists )
			{
				return
			}
			
			if(FlxG.scores[0]<50)
			{
                
				moneyTip.exists = true
					return
			}
			moneyTip.exists = false
			PlayState(FlxG.state).addCDButton(  PlayState(FlxG.state).cbtn1 )
			FlxG.scores[0]-=50
			Registry.effectG.e3(createSoliderButton1.x,createSoliderButton1.y+80,"-50");
			this.onClose()
		}
		private function onUpgrade2():void
		{
//			if(!PlayState(FlxG.state).showUpgradeWindow )return	 
			if(PlayState(FlxG.state).cbtn2.exists )return
				
			if(FlxG.scores[0]<30)
			{
				moneyTip.exists = true
				return
			}
			moneyTip.exists = false	
				
			PlayState(FlxG.state).addCDButton(  PlayState(FlxG.state).cbtn2 )
			FlxG.scores[0] -= 30
			Registry.effectG.e3(createSoliderButton2.x,createSoliderButton2.y+80,"-30");
			this.onClose()
		}
		private function onUpgrade3():void
		{
//			if(!PlayState(FlxG.state).showUpgradeWindow )return
			if(PlayState(FlxG.state).cbtn3.exists )return
				
			if(FlxG.scores[0]<40)
			{
				moneyTip.exists = true
				return
			}
			moneyTip.exists = false	
				
				FlxG.scores[0] -= 40
			PlayState(FlxG.state).addCDButton(  PlayState(FlxG.state).cbtn3 )	
			Registry.effectG.e3(createSoliderButton3.x,createSoliderButton3.y+80,"-40");
			this.onClose()
		}
		
		private function onUpgrade4():void
		{
			//			if(!PlayState(FlxG.state).showUpgradeWindow )return
			if(PlayState(FlxG.state).cbtn4.exists || FlxG.scores[0]< 40)return
				PlayState(FlxG.state).addMagicButton(  PlayState(FlxG.state).cbtn4 )			 
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