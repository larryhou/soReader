package code 
{
	import flash.filesystem.File;
	
	/**
	 * ...
	 * @author Larry H.
	 */
	public class Utils
	{
		
		/**
		 * 移除文件
		 * @param	file
		 */
		public static function remove(folder:File):void
		{
			var list:Array = folder.getDirectoryListing();
			
			for each(var item:File in list)
			{
				if (item.isDirectory)
				{
					remove(item); continue;
				}
				
				item.deleteFile();
			}
			
			folder.deleteDirectory();
		}
		
	}

}