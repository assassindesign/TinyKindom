package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxU;

	public class ShootPlayer extends Player
	{
		[Embed(source='data/shoot.png')]public var shootPlayerPNG:Class;
		[Embed(source="data/shoot.mp3")]private var shootMP3:Class
		private var _timer:Number = 0
		private var _shootInterval:Number = 0.6
		private var _targetPoint:FlxPoint = new FlxPoint()
		private var _target:FlyPlayer
		
		public function ShootPlayer()
		{
			this.loadGraphic(shootPlayerPNG,true,false,20,20)
			addAnimation("walking", [0, 1], 5, true);	
			this.play("walking");
		}
		
		override public function update():void
		{
			super.update()
			
				
			if(this.facing == FlxObject.RIGHT)
			{    
                _target = Registry.flyPlayerGroup2.getFirstExtant() as FlyPlayer			

				if(_target == null)
				{
					if(this.x +this.width < Registry.currentLevelData.home2X)
					{
						this.acceleration.x = 60
					}else
					{
						this.velocity.x = 0
					}
						
					return;
				}
			}else 
			{
				_target = Registry.flyPlayerGroup1.getFirstExtant() as FlyPlayer
				if(_target == null)
				{
					if(this.x> Registry.currentLevelData.home1X + 64 )
					{
						this.acceleration.x = -60
					}else
					{
						this.velocity.x = 0
					}
					return;
				}
			}
				
		
			 
		 
		   if(Math.abs(this.x - _target.x)<100){
		        
			   this.velocity.x = 0
			   _timer+= FlxG.elapsed				   
			   if(_timer>this._shootInterval)
			   {
				   _timer = 0					
				   _target.hurt(50);	
				   FlxG.play(this.shootMP3);
				   Registry.effectG.e2(_target.x+_target.width*0.5,_target.y+_target.height*0.5);
				   this.velocity.y = -50
			   }
		   
		   }else
		   {
			   if(this.x<= _target.x)
			   {
				   this.acceleration.x = 180
			   }else
			   {
				   this.acceleration.x = -180
			   }
		   }
			   
		
			
		
					
					
					/*
		   _timer+= FlxG.elapsed	
				if(_timer>this._shootInterval)
				{
				_timer = 0					
				_target.hurt(50);	
				var p:FlyPlayer = Registry.flyPlayerGroup1.getFirstAlive() as FlyPlayer
				if(p!=null)
				{
				    _targetPoint.x = p.x+p.width/2
					_targetPoint.y = p.y + p.height/2
					var angle:Number = FlxU.getAngle(getMidpoint(_point), _targetPoint);
					var speedP:FlxPoint = FlxU.rotatePoint(0,100,0,0,angle+2);
					var b:ShootBullet = Registry.bulletsGroup2.recycle(ShootBullet) as ShootBullet
					b.shoot(_point,speedP);
					*/
					
					
					
				}

	}
}