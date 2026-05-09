package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Main extends Sprite
{
	public function new()
	{
		super();

		if (stage != null)
			_init();
		else
			addEventListener(Event.ADDED_TO_STAGE, _init);
	}

	function _init(?e:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
			removeEventListener(Event.ADDED_TO_STAGE, _init);

		stage.align     = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		#if mobile
		addChild(new FlxGame(0, 0, TitleState));
		#else
		addChild(new FlxGame(1280, 720, TitleState));
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end

		#if android
		FlxG.android.preventDefaultKeys = [BACK];
		#end
	}
}
