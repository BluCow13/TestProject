package net.natpat 
{
	/**
	 * ...
	 * @author ...
	 */
	
	 import flash.display.BitmapData;
	 import flash.geom.Rectangle;
	 
	public class Platform 
	{
		public var x:Number;
		public var y:Number;
		
		public var width:Number;
		public var height:Number;
		
		public function Platform(_x:int, _y:int, _width:int, _height:int) 
		{
			x = _x;
			y = _y;
			width = _width;
			height = _height;
		}
		
		public function render(buffer:BitmapData):void
		{
			buffer.fillRect(new Rectangle(x, y, width, height), 0xff8B2500);
		}
	}

}