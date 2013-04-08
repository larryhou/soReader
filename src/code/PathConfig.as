package code 
{
	import flash.desktop.NativeApplication;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	/**
	 * 路径配置
	 * @author Larry H.
	 */
	public class PathConfig
	{
		private var _swfSOPath:String = null;
		private var _appSOPath:String = null;
		
		private var _isReady:Boolean = false;
		
		public function PathConfig()
		{
			initConfig();
		}
		
		
		private function initConfig():void
		{	
			var userFold:String = File.userDirectory.url;
			
			var app:NativeApplication = NativeApplication.nativeApplication;
			
			var reg:RegExp = /windows\s*(7|vista)/i;			
			var os:String = Capabilities.os;
			if (reg.test(os))
			{
				_swfSOPath = userFold+ "/AppData/Roaming/Macromedia/Flash%20Player/%23SharedObjects";
				_appSOPath = userFold + "/AppData/Roaming/" + app.applicationID + "/Local%20Store/%23SharedObjects/" + app.applicationID + ".swf";
			}
			else
			{
				reg = /windows\s*xp/i;
				if (reg.test(os))
				{
					_swfSOPath = userFold + "/Application%20Data/Macromedia/Flash%20Player/%23SharedObjects";
					
					_appSOPath = userFold + "/Application%20Data/";
					_appSOPath += app.applicationID + "/local%20store/%23SharedObjects/" + app.applicationID + ".swf";
				}
			}
		}
		
		/**
		 * swf共享文件路径
		 */
		public function get swfSOPath():String 
		{ 
			//if (!_isReady) initConfig();
			
			return _swfSOPath; 
		}
		
		
		/**
		 * 程序安装路径
		 */
		public function get appSOPath():String 
		{ 
			//if (!_isReady) initConfig();
			
			return _appSOPath; 
		}
		
	}

}