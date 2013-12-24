package
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class FlyPlayer extends Player
	{
		
		[Embed(source='data/flPlayer.png')]public var flyPlayer:Class;
		[Embed(source="data/flyhit.mp3")]private var hitMP3:Class;
		public function FlyPlayer()
		{
			this.loadGraphic(flyPlayer,true,false,20,20)
			addAnimation("walking", [0, 1], 5, true);	
			this.acceleration.y = 0
			this.maxVelocity.x = 2500
			this.play("walking");
		}
		private var _shootTimer:Number = 0.5
		private var _timer:Number = 0
			
		private var _target:FlxSprite
		private var _targetPoint:FlxPoint = new FlxPoint()
		private var _midPoint:FlxPoint =new FlxPoint()
			
			
		override public function update():void
		{
			
			
			if(this.facing == FlxObject.RIGHT)
			{    
				_target = Registry.playerGroup2.getFirstExtant() as FlxSprite
					
				if(_target!=null)
				{
					_targetPoint.x = _target.x  +_target.width*0.5
					_targetPoint.y = _target.y  - 60
					
				}else
				{
					
					_targetPoint.x = Registry.currentLevelData.home2X
					_targetPoint.y = Registry.currentLevelData.home2Y - 20
	 
				}
					
			}else
			{ 
				_target = Registry.playerGroup1.getFirstExtant() as FlxSprite
				if(_target!=null)
				{
					_targetPoint.x = _target.x  +_target.width*0.5
					_targetPoint.y = _target.y  - 60
					
				}else
				{
					
					_targetPoint.x = Registry.currentLevelData.home1X+64
					_targetPoint.y = Registry.currentLevelData.home1Y - 20
		 
				}
			}
			
			 
			

			this.getMidpoint(_midPoint)
			
			
			if(Math.abs(_targetPoint.x - _midPoint.x ) <4  && Math.abs(_targetPoint.y - _midPoint.y)<4 )
			{
				
				this.x = _targetPoint.x- this.width*0.5
				this.y = _targetPoint.y - this.height*0.5
				
				if(_target!=null)
				{
					this._timer+=FlxG.elapsed
					
					if(this._timer>this._shootTimer)
					{
						this._timer = 0
						Registry.effectG.e1(this.x+this.width*.5,this.y+this.height)
						_target.hurt(20);
					    FlxG.play(this.hitMP3);
					}
				}
				
				
				
			}else
			{   
				FlxU.rotatePoint(0,50,0,0,FlxU.getAngle(_midPoint,_targetPoint),_targetPoint);
				this.velocity.x= _targetPoint.x;
				this.velocity.y= _targetPoint.y;
			}
			
			
			
			
		}
		
		override public function destroy():void
		{
			this._target = null
			super.destroy()
		}
 
	}
}