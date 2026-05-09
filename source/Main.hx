package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.scaleModes.RatioScaleMode;

import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.StageDisplayState;
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

		addChild(new FlxGame(0, 0, TitleState));

		FlxG.scaleMode = new RatioScaleMode();

		#if mobile
		stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		#end

		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end

		#if android
		FlxG.android.preventDefaultKeys = [BACK];
		#end
	}
}
