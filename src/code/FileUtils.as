package code 
{
	import flash.filesystem.File;
	/**
	 * ...
	 * @author Larry H.
	 */
	public class FileUtils
	{
		
		/**
		 * 移除文件
		 * @param	file
		 */
		public static function removeFile(file:File):void
		{
			var list:Array = file.getDirectoryListing();
			
			for each(var subFile:File in list)
			{
				if (subFile.isDirectory)
				{
					removeFile(subFile); continue;
				}
				
				subFile.deleteFile();
			}
			
			file.deleteDirectory();
		}
		
	}

}