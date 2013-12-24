package
{
	import org.flixel.*;
	import org.flixel.system.FlxTile;
 
	
	public class Player extends FlxSprite
	{
//		[Embed(source='data/helmutguy.png')]public var Helmutguy:Class;
		[Embed(source='data/soldier.png')]public var Helmutguy:Class;
		
		protected static const RUN_SPEED:int = 60;
		protected static const GRAVITY:int =420;
		protected static const JUMP_SPEED:int = 180;
		
		public var jumpTile:uint = 14
		public function Player(X:int=0,Y:int=0):void // X,Y: Starting coordinates
		{
			
			super(X, Y);
		   
//			this.offset.x = 30
//			this.health = 100
			loadGraphic(Helmutguy,true,true);  //Set up the graphics
			addAnimation("walking", [0, 1], 5, true);
			addAnimation("idle", [0]);
//			this.width = 100
//			this.width = 300
//			drag.x = RUN_SPEED * 8;
			acceleration.y = GRAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
//			this.elasticity = 0.5
		}
		
 


		 
			
		 
		public override function reset(X:Number, Y:Number):void
		{
			super.reset(X,Y);
		    this.health = 100;
		}
 
		public override function update():void
		{
			 var s:* = Registry
			if((this.facing==FlxObject.RIGHT && this.x>Registry.map.width) || this.y>Registry.map.height || (this.facing==FlxObject.LEFT &&this.x<0) || this.y<-100) return this.kill()

		
			if(this.isTouching(FlxObject.FLOOR))  //地面
			{
			  if(this.justTouched(FlxObject.FLOOR))
			   { 
				   // 右下角
				   if(Registry.tileMap.getTile(uint((this.x + this.width)/32) , uint((this.y+this.height)/32))==jumpTile)
				   {
					 
					   velocity.y = -JUMP_SPEED;
					   this.facing == FlxObject.RIGHT ? velocity.x = JUMP_SPEED : velocity.x = -JUMP_SPEED
				   }else if(Registry.tileMap.getTile(uint(this.x)/32 , uint((this.y+this.height)/32))==jumpTile) //左下角
				   {
					   velocity.y = -JUMP_SPEED;
					   this.facing == FlxObject.RIGHT ? velocity.x = JUMP_SPEED : velocity.x = -JUMP_SPEED
				   }
			   }else if(this.isTouching(FlxObject.RIGHT))
			   {
				   if(Registry.tileMap.getTile((this.x+this.width+1)/32 , this.y/32)==jumpTile)
				   {
					   velocity.y = -JUMP_SPEED;
					   
				   }
			   }else if(this.isTouching(FlxObject.LEFT))
			   {  
				   if(Registry.tileMap.getTile((this.x-1)/32,this.y/32) ==  this.jumpTile )
				   {
					   this.velocity.y = -JUMP_SPEED
				   }
			   }else
			   {   //下中心点
//				   trace(this.x,(uint((this.x+this.width*.5 )/32)*32+16))
				   if(Registry.tileMap.getTile(uint((this.x+this.width*.5 )/32) , uint((this.y+this.height+1)/32))==jumpTile  )
				   {
					   velocity.y = -JUMP_SPEED;
					   this.facing == FlxObject.RIGHT ? velocity.x = JUMP_SPEED : velocity.x = -JUMP_SPEED
				   }
			   }
				
			}
				

			 


			
		    
			if (velocity.x != 0) { play("walking"); }
			else if (!velocity.x) { play("idle"); }
			
			super.update();
			
		}
		
		override public function kill():void
		{
			super.kill()
			this.health = 0
		}
	}
}