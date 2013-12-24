package
{
	import org.flixel.FlxG;

	public class LEVEL
	{
		[Embed(source="data/level/level0.csv", mimeType = 'application/octet-stream')]public var level0Map:Class;
		[Embed(source="data/level/level1.csv", mimeType = 'application/octet-stream')]public var level1Map:Class;
		[Embed(source="data/level/level5.csv", mimeType = 'application/octet-stream')]public var level5Map:Class;
		[Embed(source="data/level/level7.csv", mimeType = 'application/octet-stream')]public var level7Map:Class;
		[Embed(source="data/level/level8.csv", mimeType = 'application/octet-stream')]public var level8Map:Class;
		[Embed(source="data/level/level9.csv", mimeType = 'application/octet-stream')]public var level9Map:Class;
		[Embed(source="data/level/level10.csv", mimeType = 'application/octet-stream')]public var level10Map:Class;
		
		[Embed(source = 'data/32tile.png')]public var level1Tiles:Class;
		
		public static var currentLevel:uint = 15 // 从1开始
			
		public var mapData:String
		public var tileGraphic:Class
		
		public var home1X:Number
		public var home1Y:Number
		public var home2X:Number
		public var home2Y:Number
		
		public var tip:String = ""
			
		public var enemyStartTime:Number =0
		

		public var  e1Interval:Number = 1
		public var  e1Max:Number = 0
			
		public var  e2Interval:Number = 1
		public var  e2Max:Number = 0

		public var  e3Interval:Number = 0
		public var  e3Max:Number = 0
			
		public var levelMoney:Number = 0
		/** need a factory maybe...**/
		public function LEVEL( )
		{
			
			this.e1Max = this.e2Max = this.e3Max = levelMoney =0
			this.tip = ""
			switch (currentLevel)
			{
				case 1:
					
				    this.home1X = 64
					this.home1Y = 224
					
					this.home2X = 352
					this.home2Y = 224
					
					this.mapData  = String(new level0Map() )
					this.tileGraphic = this.level1Tiles
					levelMoney =75
					this.tip =  Lang.TIP1[Lang.currentLang]
				break;
				
				
				case 2:
					
					this.home1X = 64
					this.home1Y = 224
					
					this.home2X = 832
					this.home2Y = 224
					
					this.mapData  = String(new level1Map() )
					this.tileGraphic = this.level1Tiles
					
					this.enemyStartTime = 4
					this.e1Interval = 4
					this.e1Max = 1
					this.tip =  Lang.TIP2[Lang.currentLang]
					levelMoney =100
					break;
				
			   case 3:
				   
				   this.home1X = 64
				   this.home1Y = 224
				   
				   this.home2X = 832
				   this.home2Y = 224
				   
				   this.mapData  = String(new level1Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   this.enemyStartTime = 4
				   this.e1Interval = 4
				   this.e1Max = 8
				   this.tip =   Lang.TIP3[Lang.currentLang]
				   levelMoney =130
				
			   break;
			   
			   
			   case 4:
				   
				   this.home1X = 64
				   this.home1Y = 224
				   
				   this.home2X = 832
				   this.home2Y = 224
				   
				   this.mapData  = String(new level1Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   this.enemyStartTime = 2
				   this.e2Interval = 6
				   this.e2Max = 3
				   levelMoney =140
				   this.tip = Lang.TIP4[Lang.currentLang]
			  break;
			   
			  case 5:
				   
				   this.home1X = 64
				   this.home1Y = 224
				   
				   this.home2X = 832
				   this.home2Y = 224
				   
				   this.mapData  = String(new level1Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   this.enemyStartTime = -6
				   
				   this.e1Interval = 10
				   this.e1Max = 3
				   this.e2Interval = 18
				   this.e2Max = 2
				   this.e3Max = 3
				   this.e3Interval = 32
				   levelMoney =250
				   this.tip =  Lang.TIP5[Lang.currentLang]
				   
				   
			  break;
			   
			   
			   case 6:
				   this.home1X = 64
				   this.home1Y = 224
				   
				   this.home2X = 736
				   this.home2Y = 160
				   
				   this.mapData  = String(new level5Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   this.tip =  Lang.TIP6[Lang.currentLang]
				   levelMoney =200
				    this.enemyStartTime = 4
				   this.e2Interval = 18
				   this.e2Max = 3
				   this.e1Interval  =5
				   this.e1Max = 3
				break
			   
			   
			   case 7:
				   this.home1X = 64
				   this.home1Y = 224
				   
				   this.home2X = 864
				   this.home2Y = 96
				   
				   this.mapData  = String(new level7Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   this.tip = ""
				   levelMoney =150
				   this.enemyStartTime = -5
				   this.e2Interval = 18
				   this.e2Max = 1
				   this.e1Interval  =10
				   this.e1Max = 3
				   break
			   
			   
			   case 8:
				   this.home1X = 64
				   this.home1Y = 96
				   
				   this.home2X = 864
				   this.home2Y = 96
				   
				   this.mapData  = String(new level8Map() )
				   this.tileGraphic = this.level1Tiles
				   
//				   this.tip = "You need a UP Stone to get higher."
				   levelMoney =150
				   this.enemyStartTime = 0
				   this.e2Interval = 18
				   this.e2Max = 0
				   this.e1Interval  =5
				   this.e1Max = 8
			   break
			   
			   case 8:
				   this.home1X = 64
				   this.home1Y = 96
				   
				   this.home2X = 864
				   this.home2Y = 96
				   
				   this.mapData  = String(new level8Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   //				   this.tip = "You need a UP Stone to get higher."
				   levelMoney =150
				   this.enemyStartTime = -2
				   this.e2Interval = 18
				   this.e2Max = 0
				   this.e1Interval  =4
				   this.e1Max = 8
				   break
			   
			   case 9:
				   this.home1X = 64
				   this.home1Y = 96
				   
				   this.home2X = 864
				   this.home2Y = 96
				   
				   this.mapData  = String(new level9Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   //				   this.tip = "You need a UP Stone to get higher."
				   levelMoney =300
				   this.enemyStartTime = 0
				   this.e2Interval = 60
				   this.e2Max = 100
				   
				   this.e1Interval  =8
				   this.e1Max = 8
				   this.e3Interval = 23
				   this.e3Max = 10
				   break
			   case 10:
				   this.home2X = 512
				   this.home2Y = 96
				   
				   this.home1X = 64
				   this.home1Y = 348
				   
				   this.mapData  = String(new level10Map() )
				   this.tileGraphic = this.level1Tiles
				   
				   //				   this.tip = "You need a UP Stone to get higher."
				   levelMoney =300
				   this.enemyStartTime = 0
				   this.e2Interval = 60
				   this.e2Max = 100
				   
				   this.e1Interval  =8
				   this.e1Max = 8
				   this.e3Interval = 23
				   this.e3Max = 10
				   break
			}
				
			
			

			
		}
	}
}