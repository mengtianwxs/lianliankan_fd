package 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author mengtianwxs
	 */
	public class Map 
	{
		//地图中所有的对象都存放在此数组中
		public var ar_all:Array = [];
		private var _container:Sprite;
		private var _map:Array = [];
		
		public function Map(container:Sprite) 
		{
			this._container = container;
		}
		
		public  function getAllObject():Array{
			
			return ar_all;
		}
		
		//地图的列数
		public static function getLieShu(map:Array):int{
			
			//二维数组
			
			return map[0].length;
			
		}
		
		//地图的行数
		public static function getHangShu(map:Array):int{
			
			return map.length;
		}
		
		//为每个数字赋与贴图
		public  function generateTieTuAndPushToContainer(map:Array):void{
			
			//为每个数字赋与材质
			var hangshu:int = Map.getHangShu(map);
			var lieshu:int = Map.getLieShu(map);
			
			for (var i:int=0;i<hangshu;i++) {
				for(var n:int=0;n<lieshu;n++){
					var m:int = map[i][n];
					//lan se
					if(m==1){
						var lan:FK1_Lan = new FK1_Lan();
						lan.x=50*n;
						lan.y=50*i;
						this._container.addChild(lan);
						ar_all.push(lan);
						
					}
					
					// hong se
					if(m==2){
						
						var red:FK2_Red = new FK2_Red();
						red.x=50*n;
						red.y=50*i;
						this._container.addChild(red);
						ar_all.push(red);
					}
					
					//lv se
					if(m==3){
						
						var green:FK3_Green = new FK3_Green;
						green.x=50*n;
						green.y=50*i;
						this._container.addChild(green);
						ar_all.push(green);
					}
					
					
					
				}


				
			}
			
		}
		
		
		
		public  function genrateMap():Array{
			
			_map= [
				[
					2, 2, 1, 1,1,1
				], 
				[
					2, 1,1, 2, 1,1
				]
				, 
				[
					2, 1,1, 2, 1,1
				]
				, 
				[
					2, 1,1, 2, 1,1
				]
				, 
				[
					2, 1,1, 2, 1,1
				]
				, 
				[
					2, 1,1, 2, 1,1
				]
				
				
				
			];
			
			return _map;
		}
		
	}

}

//[
					//2, 1,1, 0, 1, 1
				//], 
				//[
					//2, 3,1, 0, 2, 1
				//], 
				//[
					//2, 1,3, 0, 2, 1
				//],
				//[
					//2, 3,0, 1, 3, 1
				//],
				//[
					//2, 1,3, 0, 2, 2
				//],
				//[
					//2, 1,1, 1, 3, 1
				//]