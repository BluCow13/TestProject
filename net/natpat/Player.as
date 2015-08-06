package net.natpat 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.natpat.utils.Key;
	/**
	 * ...
	 * @author ARCHIE EVANS
	 */
	public class Player 
	{
		
		public var platforms:Array;
		
		public var x:      Number;
		public var y:      Number;
		public var width:  Number = 50;
		public var height: Number = 50;
		public var yV:     Number =  0;
		
		public var grounded:   Boolean;
		public var onPlatform: Boolean;
		public var landed:     Boolean;
		
		
		public function Player(_x:int, _y:int, _platforms:Array) 
		{
			x = _x;
			y = _y;
			platforms = _platforms;
		}
		
		public function render(buffer:BitmapData):void
		{
			buffer.fillRect(new Rectangle(x, y, width, height), 0xffff0000);
		}
		
		public function update():void 
		{
			var yTemp:Number = y;
			var xTemp:Number = x;
			var yDiff:Number;
			var xDiff:Number;
			
			// y movement
			
			if (Input.keyDown(Key.UP) && grounded) 
			{
				yV = -10;
			}
			
			if (yV != 0)
			{
				landed = false;
			}
			
			yV += GC.GRAVITY;
			
			y += yV;
			
			yDiff = yTemp - y;	
			
			grounded = false;
			
			
			
			for each(var platform:Platform in platforms)
			{
				onPlatform = false;
				
				while (GV.intersects(/* player */ x, y, width, height, /* platform */ platform.x, platform.y, platform.width, platform.height))
				{
					y += yDiff / 100;					
					yV = 0;
					
					grounded = true;
					onPlatform = true;
				}
				
				if (onPlatform && !landed)
				{
					landed = true;
					if (platform.activated)
					{
						platform.activated = false;
					}
					else
					{
						platform.activated = true;
					}
				}
			}
			
			// x movement
			
			if (Input.keyDown(Key.RIGHT)) 
			{
				x += 5;
			}
			
			if (Input.keyDown(Key.LEFT)) 
			{
				x += -5;
			}
			
			xDiff = xTemp - x;
			
			for each(var platform:Platform in platforms)
			{
				while (GV.intersects(/* player */ x, y, width, height, /* platform */ platform.x, platform.y, platform.width, platform.height))
				{
					x += xDiff / 100;
				}
			}
		}
	}

}