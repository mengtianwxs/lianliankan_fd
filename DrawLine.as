package 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author mengtianwxs
	 */
	public class DrawLine extends Sprite
	{
		
		public function DrawLine(p1:Point,p2:Point) 
		{
			this.graphics.clear();
			this.graphics.lineStyle(5, 0xff0000);
			this.graphics.moveTo(Number(p1.x)+25,Number(p1.y)+25);
			this.graphics.lineTo(Number(p2.x)+25, Number(p2.y)+25);
		
			this.graphics.endFill();
		}
		
		
		
	}

}