package net.natpat 
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.GlowFilter;
	import flash.geom.Rectangle;
	import net.natpat.gui.Button;
	import net.natpat.gui.InputBox;
	import net.natpat.particles.Emitter;
	import net.natpat.utils.Sfx;
	
	import net.natpat.gui.Text;
	import net.natpat.gui.GuiManager
	import net.natpat.utils.Ease;
	import net.natpat.utils.Key;
	
	/**
	 * ...
	 * @author Nathan Patel
	 */
	public class GameManager 
	{
		/**
		 * Bitmap and bitmap data to be drawn to the screen.
		 */
		public var bitmap:Bitmap;
		public static var renderer:BitmapData;
		public var player1:Player;
		public var platforms:Array;
		
		public function GameManager(stageWidth:int, stageHeight:int) 
		{
			GC.SCREEN_WIDTH = stageWidth;
			GC.SCREEN_HEIGHT = stageHeight;
			
			renderer = new BitmapData(stageWidth, stageHeight, false, 0x000000);
			
			bitmap = new Bitmap(renderer);
			
			GV.screen = renderer;
			
			buildPlatforms();
			
			player1 = new Player(10, 10, platforms);
		}
		
		public function buildPlatforms():void
		{			
			platforms = new Array();
			
			platforms.push(new Platform(0, 550, GC.SCREEN_WIDTH, 50));
			
			platforms.push(new Platform(500, 350, 300, 200));
			
			platforms.push(new Platform(300, 450, 200, 100));
		}
		
		public function render():void
		{
			renderer.lock();
			
			//Render the background
			renderer.fillRect(new Rectangle(0, 0, renderer.width, renderer.height), 0xffffff);
			
			for each(var platform in platforms)
			{
				platform.render(GV.screen);
			}
			
			player1.render(GV.screen);
			
			GuiManager.render(GV.screen);
			
			renderer.unlock();
		}
		
		public function update():void
		{
			GuiManager.update();
			
			player1.update();
			
			Input.update();
		}
		
	}

}