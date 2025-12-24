package stokin.states;

import stokin.backend.EzDiscord;
import stokin.backend.codeins.CodeinBeatState;
import mikolka.compatibility.ModsHelper;

class MainMenuState extends CodeinBeatState
{
	public var stickerSubState:Bool;

	public var transitioning:Bool = false;

	public function new(?stickers:Bool = false)
	{
		super();
		stickerSubState = stickers;

		addCodein(CREATE, function()
		{
			try
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
			}
			catch (e)
			{
				trace(e.message);
			}

			EzDiscord.changePresence("In the Menus", null);
		});

		addCodein(UPDATE, function()
		{
			if (FlxG.keys.justReleased.ANY && !transitioning)
			{
				transitioning = true;

				FlxG.camera.flash(FlxColor.WHITE, 4, function()
				{
					MusicBeatState.switchState(new TitleState());
				});
				FlxG.sound.play(Paths.sound('cancelMenu-wood'));
			}
		});
	}
}
