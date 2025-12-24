package stokin;

class Global
{
	public static var modVersion(get, never):String;

	static function get_modVersion():String
		return Application.current.meta.get('version');

	#if !LEGACY_PSYCH
	public static var psychEngineVersion:String = '1.0.4';
	#else
	public static var psychEngineVersion:String = '0.6.3';
	#end
	public static var pSliceVersion:String = '3.4.2';
	public static var funkinVersion:String = '0.7.6'; // Version of funkin' we are emulationg
}
