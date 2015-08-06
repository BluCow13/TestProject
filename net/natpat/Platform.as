package net.natpat 
{
	/**
	 * ...
	 * @author ...
	 */
	
	 import adobe.utils.CustomActions;
	 import flash.display.BitmapData;
	 import flash.geom.Rectangle;
	 
	public class Platform 
	{
		public var x:      Number;
		public var y:      Number;		
		public var width:  Number;
		public var height: Number;
		
		public var colour:    uint;
		public var offColour: uint;
		public var onColour:  uint;
		
		public var activated: Boolean;
		
		public function Platform(_x:int, _y:int, _width:int, _height:int, _offColour:uint, _onColour:uint) 
		{
			x      = _x;
			y      = _y;
			width  = _width;
			height = _height;
			
			offColour = _offColour;
			onColour  = _onColour;
			
			activated = false;
		}
		
		public function render(buffer:BitmapData):void
		{
			if (activated)
			{
				colour = onColour;
			}
			else
			{
				colour = offColour;
			}
			buffer.fillRect(new Rectangle(x, y, width, height), colour);
		}
	}

}