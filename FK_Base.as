package 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author mengtianwxs
	 */
	public class FK_Base extends Sprite
	{
		
		public function FK_Base(color:uint) 
		{
			this.graphics.beginFill(color, 1);
			this.graphics.drawRoundRect(0, 0, 50, 50, 15, 15);
			this.graphics.endFill();
			
		}
		
	}

}