package stokin.states;

import stokin.backend.codeins.CodeinBeatState;

class TitleState extends CodeinBeatState
{
	public var title:FlxText;

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
	}
}
