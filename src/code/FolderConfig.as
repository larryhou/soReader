package code 
{
	import flash.desktop.NativeApplication;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	
	/**
	 * 路径配置
	 * @author Larry H.
	 */
	public class FolderConfig
	{
		private var _swfSOFolder:String = null;
		private var _appSOFolder:String = null;
		
		private var _isReady:Boolean = false;
		
		public function FolderConfig()
		{
			initConfig();
		}
		
		
		private function initConfig():void
		{	
			_appSOFolder = File.applicationStorageDirectory.nativePath;
			_appSOFolder += "/#SharedObjects/" + NativeApplication.nativeApplication.applicationID + ".swf/"
			
			var root:String = File.userDirectory.url;
			
			var os:String = Capabilities.os;
			if (os.match(/windows\s*(7|vista)/i))
			{
				_swfSOFolder = root+ "/AppData/Roaming/Macromedia/Flash%20Player/%23SharedObjects";
			}
			else
			if (os.match(/windows\s*xp/i))
			{
				_swfSOFolder = root + "/Application%20Data/Macromedia/Flash%20Player/%23SharedObjects";
			}
			else
			if (os.match(/Mac/i))
			{
				_swfSOFolder = root + "/Library/Preferences/Macromedia/Flash%20Player/%23SharedObjects/"
			}
		}
		
		/**
		 * swf共享文件路径
		 */
		public function get swfSOFolder():String 
		{ 
			return _swfSOFolder; 
		}
		
		
		/**
		 * 程序安装路径
		 */
		public function get appSOFolder():String 
		{ 
			return _appSOFolder; 
		}
		
	}

}