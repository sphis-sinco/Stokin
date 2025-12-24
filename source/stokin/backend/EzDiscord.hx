package stokin.backend;

class EzDiscord
{
	public static function changePresence(details:String = 'In the Menus', ?state:String = null, ?smallImageKey:String, ?hasStartTimestamp:Bool,
			?endTimestamp:Float, largeImageKey:String = 'icon')
	{
		#if DISCORD_ALLOWED
		EzDiscord.changePresence(details, state, smallImageKey, hasStartTimestamp, endTimestamp, largeImageKey);
		#end
	}

	public static function resetClientID()
	{
		#if DISCORD_ALLOWED
		DiscordClient.resetClientID();
		#end
	}

	public static function check()
	{
		#if DISCORD_ALLOWED
		DiscordClient.check();
		#end
	}

	public static function loadModRPC()
	{
		#if (MODS_ALLOWED && DISCORD_ALLOWED)
		DiscordClient.loadModRPC();
		#end
	}

	public static function shutdown()
	{
		#if DISCORD_ALLOWED
		DiscordClient.shutdown();
		#end
	}

	public static function prepare()
	{
		#if DISCORD_ALLOWED
		DiscordClient.prepare();
		#end
	}

	public static function addLuaCallbacks(lua:State)
	{
		#if (LUA_ALLOWED && DISCORD_ALLOWED)
		DiscordClient.addLuaCallbacks(lua);
		#end
	}
}
