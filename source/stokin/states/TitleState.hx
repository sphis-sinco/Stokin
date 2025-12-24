package stokin.states;

class TitleState extends MusicBeatState
{
    public var title:FlxText;

	override function create()
	{
		super.create();

        title = new FlxText();
        title.text = "Stokin";
        title.size = 32;
        title.screenCenter();
        title.y -= title.height;
        add(title);
	}
}
