package stokin.states;

import stokin.backend.codeins.CodeinBeatState;

class TitleState extends CodeinBeatState
{
	public var title:FlxText;
	public var pressAny:FlxText;

	public var transitioning:Bool = false;

	override public function new()
	{
		super();

		addCodein(CREATE, function()
		{
			title = new FlxText();
			title.text = "Stokin";
			title.size = 32;
			title.screenCenter();
			title.y -= title.height;
			add(title);
		});

		addCodein(CREATE, function()
		{
			pressAny = new FlxText();
			pressAny.text = "Press anything to play";
			pressAny.size = 16;
			pressAny.screenCenter();
			pressAny.y += pressAny.height * 4;
			add(pressAny);
		});

		addCodein(UPDATE, function()
		{
			if (FlxG.keys.justReleased.ANY && !transitioning)
			{
				transitioning = true;

				FlxG.camera.flash(FlxColor.WHITE, 4, function()
				{
					MusicBeatState.switchState(new MainMenuState());
				});
				FlxG.sound.play(Paths.sound('confirmMenu-wood'));
			}
		});
	}
}
