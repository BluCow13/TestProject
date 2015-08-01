package net.natpat 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author ARCHIE EVANS
	 */
	public class Player 
	{

		public var x:Number = 100;
		public var y:Number = 150;
		
		public var width:Number = 50;
		public var height:Number = 50;
		
		public function Player() 
		{
			
		}
		
		public function render(buffer:BitmapData)
		{
			buffer.fillRect(new Rectangle(x, y, width, height), 0xffff0000);
		}
	}

}