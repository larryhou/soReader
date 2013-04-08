package code 
{
	import flash.filesystem.File;
	
	/**
	 * ...
	 * @author Larry H.
	 */
	public class Fold
	{		
		private var _fold:File = null;
		
		private var _subFoldList:Array = null;
		private var _fileList:Array = null;
		
		private var _name:String = "";
		
		/**
		 * 构造函数
		 * create a [Fold] object
		 */
		public function Fold(url:String,name:String) 
		{
			_fold = new File(url);
			
			_name = name;
			
			parseChildren();
		}
		
		/**
		 * 解析子对象
		 */
		private function parseChildren():void
		{
			var list:Array = _fold.getDirectoryListing();
			
			_fileList = [];
			_subFoldList = [];
			
			for each(var file:File in list)
			{
				if (file.isDirectory)
				{
					_subFoldList.push(new Fold(file.url,file.name)); continue;
				}
				
				_fileList.push(file);
			}
		}
		
		/**
		 * 返回节点XML
		 */
		public function get nodeXML():XML
		{
			//var node:XML = XML("<fold name=\"" + _name + "\" />");
			
			var node:XML = createFileXml(_fold, "fold");
			
			for each(var file:File in _fileList)
			{
				node.appendChild(createFileXml(file));
			}
			
			for each(var fold:Fold in _subFoldList)
			{
				node.appendChild(fold.nodeXML);
			}
			
			return node;
		}
		
		
		private function createFileXml(file:File,localName:String = null):XML
		{
			var data:XML = <file/>;
			if (localName != null)
			{
				data = XML("<" + localName + "/>");
			}
			
			data.@name =  file.name;
			data.@size = file.size;
			data.@url = file.url;	
			data.@isfold = file.isDirectory;
			
			return data;
		}
	}

}