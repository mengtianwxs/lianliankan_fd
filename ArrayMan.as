package 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author mengtianwxs
	 */
	public class ArrayMan 
	{
		private var _arr_cell:Array = [];
		private var _arr_cellType:Array = [];
		private var _arr_cellName:Array = [];
		private var _arr_map:Array = [];
		
		public function ArrayMan() 
		{
			
		}
		public function pushMap2Array(map:Array):void{
			_arr_map = map;
			
		}
		public function popMap2Array():void{
			for (var i:int = 0; i < _arr_map.length; i++){
				_arr_map.pop();
			}
		}
		public function getMapByArray():Array{
			return _arr_map;
		}
		
		public function alertMapByIndex(px:int, py:int):Array{
			
			 _arr_map[px][py] = 0;
			
			return _arr_map;
		}
		
		public function get arr_cellType():Array 
		{
			return _arr_cellType;
		}
		
		public function get arr_cellName():Array 
		{
			return _arr_cellName;
		}
		
		public function get arr_cell():Array 
		{
			return _arr_cell;
		}
		
		public function getCellArraylength():int{
			
			return _arr_cell.length;
		}
		
		public function getCellByIndex(index:int):Sprite{
			
			return _arr_cell[index] as Sprite;
		}
		
		public function getCellByName(name:String):Sprite{
			
			
			for (var i:int = 0; i < _arr_cell.length; i++){
				
				if (_arr_cell[i].name == name){
					return _arr_cell[i] as Sprite;
				}
			}
			
			return null;
		}
		
		public function getCellNameByIndex(index:int):String{
			return _arr_cellName[index] as String;
		}
		
		public function getCellTypeByIndex(index:int):String{
			return _arr_cellType[index] as String;
		}
		
		public  function pushCell2Array(cell:Sprite):void{
			_arr_cell.push(cell);
		}
		
		public function getCellPointByCell(cell:Sprite):Point{
			
			return new Point(cell.x, cell.y);
		}
		
		public function pushCellType2Array(cellType:String):void{
			_arr_cellType.push(cellType);
		}
		
		public function pushCellName2Array(cellName:String):void{
			_arr_cellName.push(cellName);
		}
		
		public function delAllArray(len:int):void{
			
			for (var i:int = 0; i < len; i++){
				_arr_cell.pop();
				_arr_cellName.pop();
				_arr_cellType.pop();
			}
		}

		
		
	}

}