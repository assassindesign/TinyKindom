package
{
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.utils.setTimeout;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	import org.flixel.system.FlxTile;
	
	import test.FlxStats;
	
//	import test.FlxStats;
	
	public class PlayState extends FlxState
	{
		[Embed(source = 'data/coins.png')]public var coinPNG:Class;
		[Embed(source="data/bmfont.png")] public var numPNG:Class;
		[Embed(source = 'data/home.png')]public var homePNG:Class;
		
		[Embed(source = 'data/e1btn.png')]public var btn1PNG:Class;
		[Embed(source = 'data/e2btn.png')]public var btn2PNG:Class;
		[Embed(source = 'data/e3btn.png')]public var btn3PNG:Class;
		
		[Embed(source="data/restart.png")]public var restartPNG:Class;
		
		[Embed(source="data/bg1.png")]public var bg1PNG:Class;
		[Embed(source="data/f.mp3")]public var fightMP3:Class;
		[Embed(source="data/ding.mp3")]public var dingMP3:Class;
		
		public var _tileMap:FlxTilemap = new FlxTilemap();
		
		//groups
		private var playerGroup1:FlxGroup = new FlxGroup(10)
		private var flyPlayerGroup1:FlxGroup = new FlxGroup(10)
		private var shootPlayerGroup1:FlxGroup = new FlxGroup(10);
//		private var bulletsGroup1:FlxGroup = new FlxGroup(10)
			
		private var playerGroup2:FlxGroup = new FlxGroup(10)
		private var flyPlayerGroup2:FlxGroup = new FlxGroup(10);
		private var shootPlayerGroup2:FlxGroup = new FlxGroup(10)
//		private var bulletsGroup2:FlxGroup = new FlxGroup(10);

		private var healthBarGroup:FlxGroup = new FlxGroup();	
  
		
		private var dolly:FlxSprite
		private var _objects:FlxGroup = new FlxGroup() //与地图碰撞的辅助group
		private var _p1grounds:FlxGroup = new FlxGroup() //地面组
		private var _p2grounds:FlxGroup = new FlxGroup()
			
		public static var showUpgradeWindow:Boolean = false
		private var _upgradeWindow:UpgradeWindow 
		private var _buttonGroup:FlxGroup = new FlxGroup()
			
		private var _gatePoint:FlxPoint 
		private var _gatePoint2:FlxPoint;
		
		private var _tip:FlxText 
		
		
//		private var _lifeTxt:FlxText 
//		private var _lifeTxt2:FlxText 			
		private var _life1:Number = 1
		private var _life2:Number = 1
			
		private var _moneyTxt:FlxBitmapFont  
		private var _moneyIncreaseInterval:Number = 5
		private var _moneyIncreaseTime:Number = 0
			
			
		private var _enemy1Timer:Number = 0
		private var _enemy2Timer:Number = 0
		private var _enemy3Timer:Number = 0
		private var _e1EnemyNumber:Number = 0
		private var _e2EnemyNumber:Number = 0
		private var _e3EnemyNumber:Number = 0
			
		private var _restartBtn:FlxButton


		public var cbtn1:CoolDownButton
		public var cbtn2:CoolDownButton
		public var cbtn3:CoolDownButton
		public var cbtn4:CoolDownButton
		
		
		private var level:LEVEL
		
			
		private var _home1Btn:FlxButtonPlus
		private var _home2Btn:FlxButtonPlus
		
		private var _magicTip:FlxText 
		
		override public function destroy():void
		{
			Registry.playerGroup1 = null
			Registry.flyPlayerGroup1 = null
			Registry.shootPlayerGroup1 = null
//			Registry.bulletsGroup1 = null
			
			Registry.playerGroup2 = null
			Registry.flyPlayerGroup2 = null
			Registry.shootPlayerGroup2 = null
//			Registry.bulletsGroup2 = null
			Registry.map = null
			Registry.effectG = null
			Registry.tileMap = null
			this.level = null
		    this._objects = null
			this._upgradeWindow.destroy()
			
			FlxG.stage.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseBegin);
			FlxG.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			FlxG.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseEnd);
	 
			super.destroy()
		 
		}

		
		
		
		
		
		
		
		
		override public function create():void
		{
			FlxG.flash(0xff03608c,0.5);
			/*FlxG.music = new FlxSound()
			FlxG.music.loadEmbedded(this.fightMP3,true);
			FlxG.music.volume = 1*/
//			FlxG.playMusic(this.fightMP3,1);
		/*	FlxG.music.destroy()
			FlxG.music.loadEmbedded(this.fightMP3,true);
			FlxG.music.fadeIn(0.5)
				*/
			
			FlxG.music.loadEmbedded(this.fightMP3,true);
			FlxG.music.fadeIn(0.5)
			
			Registry.playerGroup1 = this.playerGroup1;
			Registry.flyPlayerGroup1 = this.flyPlayerGroup1;
			Registry.shootPlayerGroup1 = this.shootPlayerGroup1;
//			Registry.bulletsGroup1 = this.bulletsGroup1;
			
			Registry.playerGroup2 = this.playerGroup2;
			Registry.flyPlayerGroup2 = this.flyPlayerGroup2;
			Registry.shootPlayerGroup2 = this.shootPlayerGroup2;
//			Registry.bulletsGroup2 = this.bulletsGroup2;
			Registry.map = this._tileMap
			Registry.effectG = new EffectG();
			Registry.tileMap = this._tileMap
//			trace("create()")
			initLevel()
			
			
			this._objects.add(this.playerGroup1)			
			this._objects.add(this.flyPlayerGroup1);
			this._objects.add(this.shootPlayerGroup1);
//			this._objects.add(this.bulletsGroup1);
			
			this._objects.add(this.playerGroup2);
			this._objects.add(this.flyPlayerGroup2)
			this._objects.add(this.shootPlayerGroup2);
//			this._objects.add(this.bulletsGroup2)

			this._p1grounds.add(this.playerGroup1)
			this._p1grounds.add(this.shootPlayerGroup1)
				
			this._p2grounds.add(this.playerGroup2)
			this._p2grounds.add(this.shootPlayerGroup2)
			
			add(this.playerGroup1);
			add(this.flyPlayerGroup1)
			add(this.shootPlayerGroup1)
//			add(this.bulletsGroup1);
			
			add(this.playerGroup2);
			add(this.flyPlayerGroup2)
			add(this.shootPlayerGroup2)
//			add(this.bulletsGroup2)
			
			add(healthBarGroup);
           


		    initCamera()
			initCoolDownButtons();
			 

			
			
//			this._buttonGroup.exists = true
			this._upgradeWindow = new UpgradeWindow()
		    
//			this.add(this._upgradeWindow)
//			this._upgradeWindow.visible = false
		
		
           
//			this._tip.shadow = 0x22888888
			
			if(Registry.currentLevelData.tip!="")
			{
				this._tip = new FlxText(20,80,440)
				this._tip.alignment = "center"
				this._tip.scrollFactor.x = this._tip.scrollFactor.y = 0
				this._tip.size = 18
				this._tip.text = Registry.currentLevelData.tip
				if(Lang.currentLang == Lang.CHINESE)
				{
					this._tip.setFormat(Lang.YaHei,18);
				}
				this.add(this._tip);
//				this._tip.flicker(0.2)
			}
		   
			
		 
//			FlxG.scores[0] = 100 // money
			FlxG.scores[1] = 0
		/*	this._moneyTxt = new FlxText(0,0,100,"money: "+FlxG.scores[0]);
		    this._moneyTxt.size = 12
			this._moneyTxt.scrollFactor.x = this._moneyTxt.scrollFactor.y =  0
			this.add(_moneyTxt);*/
			
			
			/*_lifeTxt = new FlxText(0,this._home1Btn.y-30,100,"Life: "+this._life1)
			this._lifeTxt.size = 12
			this.add(_lifeTxt);
			
			_lifeTxt2 = new FlxText(this._home2Btn.x,this._home2Btn.y-30,100,"Life: "+this._life2)
			this._lifeTxt2.size = 12
			this.add(_lifeTxt2);*/
			
			super.create();
			
			
			this._restartBtn = new FlxButton(FlxG.width - 50,10,null,onRestart);
			this._restartBtn.loadGraphic(restartPNG)
			this._restartBtn.scrollFactor.x = this._restartBtn.scrollFactor.y = 0
			this.add(this._restartBtn);
			//FlxG.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin); 
			
				
			var coin:FlxSprite = new FlxSprite(FlxG.width - 150,13,coinPNG)	
			coin.scrollFactor.x = coin.scrollFactor.y = 0
			this.add(coin);
			
			this._moneyTxt = new FlxBitmapFont(numPNG,16,16,"-0123456789",11)
			this._moneyTxt.text = FlxG.scores[0].toString()
			this._moneyTxt.scrollFactor.x = this._moneyTxt.scrollFactor.y =  0
			this._moneyTxt.x = FlxG.width - 110
			this._moneyTxt.y = 22
			this.add(_moneyTxt);
			
			
			this._magicTip = new FlxText(FlxG.width*.5 -120 , FlxG.height*.5 - 40,240,Lang.PLACE_ITEM[Lang.currentLang]);
			this._magicTip.scrollFactor.x = this._magicTip.scrollFactor.y = 0
			if(Lang.currentLang == Lang.CHINESE) _magicTip.setFormat(Lang.YaHei);
			this._magicTip.size = 16
			this._magicTip.exists = false
			add(this._magicTip);
			add(Registry.effectG);
//			Registry.map.setTileProperties(uint(14),FlxObject.NONE);
			
			
			FlxG.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseBegin);
			FlxG.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			FlxG.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseEnd);
			
			
			var s:FlxStats = new FlxStats
			s.x = FlxG.width - 70
							add(s)
			
		}

		
		private function initCoolDownButtons():void
		{
			this.cbtn1 = new CoolDownButton(0,20,null,createSoldiers1,5);
			this.cbtn1.loadGraphic(btn1PNG)
			cbtn1.exists = false
			this._buttonGroup.add(cbtn1);			
			
			
			this.cbtn2 = new CoolDownButton(0,20,null,createSoldiers2)
			this.cbtn2.loadGraphic(btn2PNG)
			cbtn2.exists = false
			this._buttonGroup.add(cbtn2);			
			
			this.cbtn3 = new CoolDownButton(0,20,null, createSoldiers3,1)
			this.cbtn3.loadGraphic(btn3PNG)
			cbtn3.exists = false
			this._buttonGroup.add(cbtn3);	
			
			this.cbtn4 = new CoolDownButton(0,20,null, createMagic1,10)
			this.cbtn4.loadGraphic(btn2PNG)
			cbtn4.exists = false
			this._buttonGroup.add(cbtn4);	
			
			
			this.add(this._buttonGroup);
		}


		
		private function createSoldiers1():Boolean
		{
			if(FlxG.scores[0]<25)return false
			FlxG.scores[0] -= 25
			Registry.effectG.e3(this.cbtn1.x,this.cbtn2.y+80,"-25");
			var p1:Player = this.playerGroup1.recycle(Player) as Player;
			p1.reset(this._gatePoint.x,this._gatePoint.y)
			p1.facing = FlxObject.RIGHT
			p1.acceleration.x = 15
				
			addHealthBar(p1)
			/*var b:FlxBar = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 20, 4, p1, "health");
			b.trackParent(0, -8)
			b.killOnEmpty = true
			this.healthBarGroup.add(b)*/
				return true
		}
		private function createSoldiers2():Boolean
		{
			if(FlxG.scores[0]< 25)return false
			FlxG.scores[0] -= 25
			Registry.effectG.e3(this.cbtn2.x,this.cbtn2.y+80,"-25");
			var fp1:FlyPlayer = this.flyPlayerGroup1.recycle(FlyPlayer) as FlyPlayer;
			fp1.reset(this._gatePoint.x,this._gatePoint.y)
			fp1.facing = FlxObject.RIGHT
			
			addHealthBar(fp1)	
			/*var b:FlxBar = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 20, 4, fp1, "health");
			b.trackParent(0,-8)
			b.killOnEmpty = true
			this.healthBarGroup.add(b);*/
		    return true
		}
		private function createSoldiers3():Boolean
		{
			
			if(FlxG.scores[0]< 25)return false
			FlxG.scores[0] -= 25
			Registry.effectG.e3(this.cbtn3.x,this.cbtn3.y+80,"-25");
			var sp1:ShootPlayer = this.shootPlayerGroup1.recycle(ShootPlayer) as ShootPlayer
			sp1.reset(this._gatePoint.x,this._gatePoint.y)
			sp1.facing = FlxObject.RIGHT
			addHealthBar(sp1)
			return true
		/*	var p2:Player = this.playerGroup2.recycle(Player) as Player
			p2.reset(400,10)
			p2.facing = FlxObject.LEFT
			p2.acceleration.x = -50				
				
			var b:FlxBar = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 20, 4, p2, "health");
			b.trackParent(0,-8)
			b.killOnEmpty = true
			this.healthBarGroup.add(b);	*/
		}

		
		private function createMagic1():void
		{
			trace("createMaggic1")
			this._magicTip.exists = true
			FlxG.timeScale = 0.1
			/*	var p2:Player = this.playerGroup2.recycle(Player) as Player
			p2.reset(400,10)
			p2.facing = FlxObject.LEFT
			p2.acceleration.x = -50				
			
			var b:FlxBar = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 20, 4, p2, "health");
			b.trackParent(0,-8)
			b.killOnEmpty = true
			this.healthBarGroup.add(b);	*/
		}
		
		private function addHealthBar(p:FlxSprite):void
		{
			/*var b:FlxBar = this.healthBarGroup.recycle(FlxBar) as FlxBar
//				b.reset(0,0)
			b.revive()
			b.init(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 20, 4, p, "health");
			b.trackParent(0,-8)
			b.killOnEmpty = true*/
			var b:FlxBar
			b =  this.healthBarGroup.getFirstAvailable() as FlxBar
			if(b!=null)
			{
//				trace("b.reset")
			    
				b.revive();
				b.setParent(p,"health",true,0,-8)
//				b.trackParent(0,-8)
				b.killOnEmpty =true
			}else
			{
				b  = new FlxBar(0,0,FlxBar.FILL_LEFT_TO_RIGHT,20,4,p,"health");
				b.trackParent(0,-8);
				b.killOnEmpty = true
				this.healthBarGroup.add(b);
			}
			
	       
			
		
		}
		
		private function createEnemy():void
		{
			
			
			
				
//			trace(int(this._enemy2Timer),int(this._enemy3Timer),int(this._enemy1Timer))
		    if(this.level.e1Max > 0 && this._e1EnemyNumber < this.level.e1Max)
			{this._enemy1Timer += FlxG.elapsed
//				trace(this._enemy1Timer , this.level.e1Interval)
				
				//enemy interval
				if( this._enemy1Timer > this.level.e1Interval )
				{
					this._enemy1Timer = 0
					var p:Player = this.playerGroup2.recycle(Player) as Player;
					p.reset(this._gatePoint2.x,this._gatePoint2.y)
					p.facing = FlxObject.LEFT
					p.acceleration.x = -15
					addHealthBar(p)
					this._e1EnemyNumber ++
				}
			}
			
			
			
			if(this.level.e2Max > 0 && this._e2EnemyNumber < this.level.e2Max)
			{
				this._enemy2Timer += FlxG.elapsed
				//enemy interval
				if( this._enemy2Timer > this.level.e2Interval )
				{
					this._enemy2Timer = 0
					var p2:FlyPlayer = this.flyPlayerGroup2.recycle(FlyPlayer) as FlyPlayer;
					p2.reset(this._gatePoint2.x,this._gatePoint2.y)
					p2.facing = FlxObject.LEFT
					addHealthBar(p2)	
					this._e2EnemyNumber ++
				}
			}
			
			
			if(this.level.e3Max > 0 && this._e3EnemyNumber < this.level.e3Max)
			{
				this._enemy3Timer += FlxG.elapsed
				//enemy interval
				if( this._enemy3Timer > this.level.e3Interval )
				{
					this._enemy3Timer = 0
						
					var p3:ShootPlayer = this.shootPlayerGroup2.recycle(ShootPlayer) as ShootPlayer;
					p3.reset(this._gatePoint2.x,this._gatePoint2.y)
					p3.facing = FlxObject.LEFT
					addHealthBar(p3)	
					this._e3EnemyNumber ++
				}
			}
			
		
			
			/*var p:Player = this.playerGroup2.recycle(Player) as Player;
			p.reset(this._gatePoint2.x,this._gatePoint2.y)
			p.facing = FlxObject.LEFT
			p.acceleration.x = -15
			addHealthBar(p)*/
			
				

		}
		override public function update():void
		{
//			if(FlxG.keys.justPressed("SPACE"))	this.showUpgradeWindow = !this.showUpgradeWindow
          
			if(this._life2 <= 0)
			{
				
				LEVEL.currentLevel++
				trace(FlxG.scores[0])
				FlxG.switchState(new LevelState());
				return
			}else if(this._life1<=0)
			{
				FlxG.switchState(new PassState);
				return
			}
			
		  
			
			if(showUpgradeWindow )
			{
			   return this._upgradeWindow.update()
			} 
			
			
			
			/*this._lifeTxt.text = "Life: "+ String(this._life1)
			this._lifeTxt2.text = "Life: "+ String(this._life2)
				*/
			this._moneyIncreaseTime+=FlxG.elapsed;
			 
			if(this._moneyIncreaseTime > this._moneyIncreaseInterval)
			{
				FlxG.scores[0]++
				this._moneyIncreaseTime = 0
			}
			
			
			
				
			this._moneyTxt.text =  FlxG.scores[0].toString()	
				
			
			if(this._magicTip.exists)
			{
				 
				if(FlxG.mouse.justPressed())
				{
					this._tileMap.setTile(FlxG.mouse.x/32,FlxG.mouse.y/32,14);
					this._magicTip.exists =false
					FlxG.timeScale = 1
				}
				if(FlxG.mouse.justReleased())
				{
					trace("release")
					/**/
				}
			}
			
			
			//			trace(this.dolly.x)
			
			//		    this.dolly.x = FlxG.mouse.x
			//			this.dolly.y = FlxG.mouse.y
			if(FlxG.mouse.justPressed())
			{

			 
				
//				trace(this._tileMap.getTile(FlxG.mouse.x/32 , FlxG.mouse.y/32))
				
				/*
				var b2:FlxBar = new FlxBar(0,0,FlxBar.FILL_LEFT_TO_RIGHT , 20,4,p2,"health")
				b2.trackParent(0, -8)
				b2.killOnEmpty = true
				this.healthBarGroup.add(b2)*/
	 
				//				p2.elasticity = 0.9
				//				trace(FlxG.mouse.x,FlxG.mouse.screenX)
				//				this.map.setTile(FlxG.mouse.x/32,FlxG.mouse.y/32,4);
				//				trace(this.map.getTile(FlxG.mouse.x/32,FlxG.mouse.y/32))
				
				
				
				//				fp1.drag.x = 50
				//fp1.velocity.x = 50
				
				/*var s2:ShootPlayer = this.shootPlayerGroup2.recycle(ShootPlayer) as ShootPlayer
				s2.reset(300,50)
				s2.facing = FlxObject.LEFT
				s2.acceleration.y = 550*/
				
			}
			//FlxG.collide(player, map);
			FlxG.collide(this._objects,_tileMap)
			 
			//			FlxG.collide(playerGroup2,map)
			//			FlxG.collide(this.playerGroup1,this.playerGroup2)
			FlxG.overlap(this._p1grounds,this._p2grounds,null,onFight)
		 
//			FlxG.overlap(this.bulletsGroup1,this.playerGroup2,null,onFight)
			//	FlxG.collide(this.playerGroup,this.playerGroup);
			//player.collide(this.playerGroup);
			
			var basic:FlxSprite;
			var i:uint = 0;
			var l:uint = this.playerGroup1.length
			while(i < l)
			{
				basic = this.playerGroup1.members[i++] as FlxSprite
			 
				if((basic != null) && basic.exists && basic.active && basic.alive)
				{ 
					 
					if(Math.abs(basic.x - this._gatePoint2.x)<15 && Math.abs(basic.y - this._gatePoint2.y) < 15 )
					{ 
//						
						basic.kill()
						this._life2 --
					}
				}
			}
				
			i= 0
			l = this.playerGroup2.length
			while(i < l)
			{
				basic = this.playerGroup2.members[i++] as FlxSprite
				
				if((basic != null) && basic.exists && basic.active && basic.alive)
				{ 
					
					if(Math.abs(basic.x - this._gatePoint.x)<15 && Math.abs(basic.y - this._gatePoint.y) < 15 )
					{ 
						//						
						basic.kill()
						this._life1 --
					}
				}
			}
			
			
			this.playerGroup1.sort("x")
			this.playerGroup2.sort("x")
			this.flyPlayerGroup2.sort("x")
			
			this.createEnemy()	
				
			
			super.update()
		}
		

		 
		
		

		private function onCollide(p1:FlxObject , p2:FlxObject):void
		{
//			trace(p2.x,p2.y)
//			trace(typeof(p1),typeof(p2),p2 is FlxTile, p2 is FlxTilemap)
		}
		
		

		
		private function onFight(p1:FlxObject,p2:FlxObject):void
		{
		 
				//p1.acceleration.x = p2.acceleration.x = 0
				if(!p1.flickering && !p2.flickering)
				{
					if(p1 is ShootPlayer && p2 is Player)
					{
						p1.hurt(40)
						p2.hurt(10)
					}else if(p2 is ShootPlayer && p1 is Player){
						
					    p2.hurt(40)
					   p1.hurt(10)
					}else
					{
						p1.hurt(10)
						p2.hurt(10)
					}
					
					p1.flicker(0.4)
					p2.flicker(0.4)
					p1.velocity.x = FlxMath.rand(-30,-10)
					p2.velocity.x = FlxMath.rand(10,30);
					FlxG.play(this.dingMP3,0.5);
				}
			 
			
	       
		}
		
		
		override public function draw():void
		{
			if(showUpgradeWindow)return this._upgradeWindow.draw()
			super.draw()
		}		
		
		/** restart the level **/
		private function onRestart():void
		{
			FlxG.switchState(new PlayState);
//			FlxG.timeScale = 3
		}		
		/** show upgrade Window **/
		private function onUpgrade():void
		{			
			if(FlxG.timeScale==1)showUpgradeWindow = true
			 
		}
		
		private var _touched:Boolean = false
		private var _mouseX:Number = 0
		private var _mouseY:Number = 0
		/** Mouse Event **/
		private function onMouseBegin(evt:MouseEvent):void { 
			
			this._touched = true
			this._mouseX=FlxG.mouse.screenX
			this._mouseY = FlxG.mouse.screenY;
			
		} 
		private function onMouseMove(evt:MouseEvent):void { 
			
			if(this._touched == true)
			{    
				if(this._mouseX>1000 )
				{
					this._mouseX = FlxG.mouse.screenX
					this._mouseY = FlxG.mouse.screenY
				}
				this.dolly.x += (this._mouseX - FlxG.mouse.screenX)*4
				this.dolly.y += ( this._mouseY - FlxG.mouse.screenY)*4
				
				this._mouseX = FlxG.mouse.screenX
				this._mouseY = FlxG.mouse.screenY
				
				/**/
				
				//				this.dolly.x = FlxG.mouse.screenX
				//				this.dolly.y =FlxG.mouse.screenY
			}
		} 
		private function onMouseEnd(evt:MouseEvent):void { 
			this._touched = false
			
			if(this.dolly.x<FlxG.width*.5)
			{
				this.dolly.x = FlxG.width*.5
			}else if(this.dolly.x>(_tileMap.width-FlxG.width*.5))
			{
				this.dolly.x = _tileMap.width-FlxG.width*.5	
			}
			
			if(this.dolly.y<FlxG.height*.5)
			{
				this.dolly.y = FlxG.height*.5
			}else if(this.dolly.y> (_tileMap.height - FlxG.height*.5))
			{
				this.dolly.y = _tileMap.height - FlxG.height*.5
			}
		} 
		
		
		/** touchEvent **/
		private function onTouchBegin(evt:TouchEvent):void { 
			FlxG.stage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			FlxG.stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
		} 		
		private function onTouchMove(evt:TouchEvent):void { 			
		} 		
		private function onTouchEnd(evt:TouchEvent):void { 
			
		}		
				
		
		/** buttons position **/
		private var _buttonStartX:Number =10
		public function addCDButton(b:CoolDownButton):void
		{
//			trace(b)
			b.x = this._buttonStartX
			b.y = 10
			b.exists = true
			b.scrollFactor.x = b.scrollFactor.y =  0
			this._buttonStartX = b.x+b.width +4
		}
		private var _buttonStartY:Number = 55
		public function addMagicButton(b:CoolDownButton):void
		{
			b.x = 10
			b.y = this._buttonStartY
			b.exists = true
			b.scrollFactor.x = b.scrollFactor.y = 0
			this._buttonStartY = b.y+b.height+4
		}
		
		/** init current level **/
		private function initLevel():void
		{
			this.level = Registry.currentLevelData
				
			FlxG.scores[0]  = this.level.levelMoney
			_enemy1Timer = _enemy2Timer = _enemy3Timer  = - this.level.enemyStartTime		
		 
			this._gatePoint =new FlxPoint(this.level.home1X+30,this.level.home1Y+40)
			this._gatePoint2 = new FlxPoint(this.level.home2X+30,this.level.home2Y+40)
			
				
				
			var bg:FlxSprite = new FlxSprite(0,0,bg1PNG)
			bg.scrollFactor.x = 0.2
			bg.scrollFactor.y =0.2
			this.add(bg)
				
			_home1Btn = new FlxButtonPlus(level.home1X, level.home1Y, onUpgrade, null, null, 64,64)		
			_home1Btn.loadGraphic(new FlxSprite(0,0,homePNG),new FlxSprite(0,0,homePNG))
			this.add(_home1Btn);
			
			
			_home2Btn = new FlxButtonPlus(level.home2X,level.home2Y,null,null,null,64,64)
			_home2Btn.loadGraphic(new FlxSprite(0,0,homePNG),new FlxSprite(0,0,homePNG))
			this.add(_home2Btn);	
			
			add(_tileMap.loadMap(this.level.mapData, this.level.tileGraphic, 32, 32));
		}
		
		
		/** init Camera**/
		private function initCamera():void
		{
			/*	c = new FlxCamera(0,0, FlxG.width, FlxG.height*2);  
			cam.follow(player2);
			// this sets the limits of where the camera goes so that it doesn't show what's outside of the tilemap
			c.setBounds(0,0,map.width, map.height);
			c.color = 0xFFCCCC; // add a light red tint to the camera to differentiate it from the other
			FlxG.addCamera(c);*/
			//	Our camera tracks this invisible sprite
			dolly = new FlxSprite(FlxG.width>>1,FlxG.height>>1);
			dolly.makeGraphic(1, 1, 0x00);	
			dolly.x = Registry.currentLevelData.home1X
			dolly.y = Registry.currentLevelData.home1Y
			add(dolly);		
			FlxG.camera.follow(dolly);
			FlxG.camera.setBounds(0,0,_tileMap.width,_tileMap.height,true);
		}
	}
}