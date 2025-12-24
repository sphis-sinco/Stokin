package stokin.states;

import mikolka.compatibility.ModsHelper;

class MainMenuState extends MusicBeatState
{
	var stickerSubState:Bool;

	public function new(?stickers:Bool = false)
	{
		super();
		stickerSubState = stickers;
	}

	override function create()
	{
		if (stickerSubState)
			ModsHelper.clearStoredWithoutStickers();
		else
			CacheSystem.clearStoredMemory();
		CacheSystem.clearUnusedMemory();
		#if (debug && !LEGACY_PSYCH)
		FlxG.console.registerFunction("dumpCache", CacheSystem.cacheStatus);
		FlxG.console.registerFunction("dumpSystem", backend.Native.buildSystemInfo);
		#end

		ModsHelper.resetActiveMods();

		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
	}
}
