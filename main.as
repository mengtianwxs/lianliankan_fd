package {

	import com.greensock.easing.Power0;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import com.greensock.TweenLite;
	import flash.utils.Timer;


	public class main extends Sprite {

		
		
		
		private var container:Sprite;
		
		private var sr1:String = "";
		private var sr2:String = "";
		private var sr3:String = "";
		
		private var map:Map;
		private var arrMan:ArrayMan;
		private var arr_alert:Array = [];
		

		public function main() {
			// constructor code

			//sw = this.stage.stageWidth;
			//sh = this.stage.stageHeight;
			
			container = new Sprite();
			this.addChild(container);
			this.addEventListener(MouseEvent.CLICK, onStageEvent);
			
			arrMan = new ArrayMan();

			map = new Map(container);	
			arrMan.pushMap2Array(map.genrateMap());
			map.generateTieTuAndPushToContainer(arrMan.getMapByArray());
			
			
		}
		
		
		
		private function onStageEvent(e:MouseEvent):void 
		{
			//trace(e.target.name, typeof(e.target.toString()), e.target.toString(), e.target.x, e.target.y);
			
			var cellType:String = e.target.toString();
			var cell:Sprite = container.getChildByName(e.target.name) as Sprite;
			var cellName:String = e.target.name;
			
			//判断数组中的元件有几个，以此来 pop or push
			arrMan.pushCell2Array(cell);
			arrMan.pushCellName2Array(cellName);
			arrMan.pushCellType2Array(cellType);
			
			var cellLength:int = arrMan.getCellArraylength();
			
			//如何cellArray中有两个对象，则开始程序处理
			
			
			
			//代码处理
			if (cellLength == 2){
				
				//
				var cell1:Sprite = arrMan.getCellByIndex(0);
				var cell2:Sprite = arrMan.getCellByIndex(1);
				
				var cellName1:String = arrMan.getCellNameByIndex(0);
				var cellName2:String = arrMan.getCellNameByIndex(1);
				
				//第一个方块的x,p坐标值
				var cell1point:Point = arrMan.getCellPointByCell(cell1);
				var cell2point:Point = arrMan.getCellPointByCell(cell2);
				
				
			
				
				//第一种情况水平消除
				if (bool_h_driction(cell1point,cell2point,arrMan)){
					
					//draw line
					
					var line:DrawLine = new DrawLine(cell1point,cell2point);
					container.addChild(line);
					
					TweenLite.to(this, 0.5, {onComplete:onEnd});
					//trace(ar_tarname[0] as String);
					sr1 = arrMan.getCellNameByIndex(0);
					sr2 = arrMan.getCellNameByIndex(1);
					sr3 = line.name;
					
					
				}	
				
				
				arrMan.delAllArray(cellLength);
				
			}
			
			
			
			
			
			//清空数组
			
			//if (pos_len == 2){
				//for (var i:int = 0; i < pos_len ; i++){
					//ar_pos.pop();
					//ar_name.pop();
					//ar_tarname.pop();
					//
				//}
				//
				//
				//
			//
			//}
			
			//trace(ar_pos,ar_pos.length,"mt>>>>>>>>>>>>>>>>");
			
		   
			
			
			//@1 水平直线
			
			
			
			//this.removeChild(trg);
			
			
		}
		
		//第一种情况
		private function bool_h_driction(p1:Point, p2:Point,arrMan:ArrayMan):Boolean{
			
			var b1:Boolean = true;
			var b2:Boolean = true;
			var b3:Boolean = true;
			var b4:Boolean = true;
			var b5:Boolean = true;
			var btype:Boolean = true;
			
			//判断是否是同一个对象
			if (p1.x == p2.x && p1.y == p2.y)
			{
				b1 = false;
				
			}
			
			//判断是否在一个水平线上
			if (p1.y == p2.y){
				b2 = true;
			}else{
				b2 = false;
			}
			
			//判断类型是否一样
			
			var cellType1:String = arrMan.getCellTypeByIndex(0);
		    var cellType2:String = arrMan.getCellTypeByIndex(1);
			if ( cellType1 == cellType2)
			  {
				btype = true;
			   }
			else
			{
				btype = false;
				
			  }

			//// 判断横着的几种情况
			var smallx:Number = ( p1.x < p2.x)?p1.x:p2.x;
			var bigx:Number = (p1.x < p2.x)?p2.x:p1.x;
			var y1:Number = p1.y;
			var hanghao:int = y1 / 50;
			var lieshu:int = (bigx - smallx) / 50 + 1;
			var liehao:int = smallx / 50;
				
				
			
			//如果列数是2的情况	证明横着相连只有2个对象,类型相同则返回true
			if (lieshu == 2)
			{
			  b3 = true;
			}
			
			
			
			var maparr:Array = arrMan.getMapByArray();	
		//如果列数是3的情况
		if (lieshu == 3){
		//trace("lieshu3");
		//trace(arrMan.getMapByArray());
		
		var n:int = maparr[hanghao][liehao+1] as int ;
		if (n == 0){
			b4 = true;
				
			
		}else{
			b4 = false;
		}}
		
		
		if (lieshu > 3){
			trace(p1, p2,  "hanghao", hanghao, "lieshu", lieshu, "liehao", liehao);
		
			for (var i:int = 1; i < lieshu - 1; i++ ){
				
				
				
				var n:int = maparr[hanghao][liehao + i] as int;
				
				trace(i,hanghao,liehao+i,"n",n);
				if (n == 0){
					b5 = true;
				}else{
					b5 = false;
				}
			}
			
			
		}
		
			
			//
			return b1&&b2&&b3&&b4&&b5&&btype;
			
			
		}
		
		
		private function onEnd():void{
			
		//删除之后需要重新标记地图
		
		           var s1:Sprite = container.getChildByName(sr1) as Sprite;
				   var s2:Sprite = container.getChildByName(sr2) as Sprite;
				   
				  
				   var p1:Point = new Point(s1.x, s1.y);
				   var p2:Point = new Point(s2.x, s2.y);
				   
				   
			//// 判断横着的几种情况
			var smallx:Number = ( p1.x < p2.x)?p1.x:p2.x;
			var bigx:Number = (p1.x < p2.x)?p2.x:p1.x;
			var smally:Number = (p1.y < p2.y)?p1.y:p2.y;
			var bigy:Number = (p1.y < p2.y)?p2.y:p1.y;
			
			var start_y:int = smally / 50;
			var start_x:int = smallx / 50;
			var end_x:int = bigx / 50;
			var end_y:int = bigy / 50;
			
			 //trace("sx", start_x, "starty", start_y, "endx", end_x, "endy", end_y);
			 //trace(arrMan.getMapByArray());
			 
			 //更新坐标
			arrMan.alertMapByIndex(start_y, start_x);
			arr_alert = arrMan.alertMapByIndex(end_y, end_x);
			//arrMan.popMap2Array();
			arrMan.pushMap2Array(arr_alert);
			 
			 
			 //var mm:Array = map.setMapZero(end_x, end_y);
			 //trace("--------------");
			 //trace(arrMan.getMapByArray());
			 				
				    container.removeChild(s1);
					container.removeChild(container.getChildByName(sr2));
					container.removeChild(container.getChildByName(sr3));
					
				
					
					
					
					
					
					
		}
		
		
		
	
	}

}