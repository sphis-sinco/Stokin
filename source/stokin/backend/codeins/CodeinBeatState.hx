package stokin.backend.codeins;

import flixel.util.FlxSignal;

class CodeinBeatState extends MusicBeatState
{
	public var createSignal:FlxSignal = new FlxSignal();
	public var updateSignal:FlxSignal = new FlxSignal();

	public function addCodein(type:CodeinTypes, listener:Void->Void)
	{
		switch (type)
		{
			case CREATE:
				createSignal.add(listener);
			case UPDATE:
				updateSignal.add(listener);
		}
	}

	override function create()
	{
		super.create();

		createSignal.dispatch();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		updateSignal.dispatch();
	}
}
