package;

import flixel.FlxG;
import flixel.FlxGame;
import mobile.Fullscreen;

import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

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
		var w = stage.stageWidth;
		var h = stage.stageHeight;
		addChild(new FlxGame(w, h, TitleState));
		Fullscreen.apply();
		#else
		addChild(new FlxGame(1280, 720, TitleState));
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end

		#if android
		FlxG.android.preventDefaultKeys = [BACK];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent)
		{
			if (e.keyCode == Keyboard.BACK)
				e.preventDefault();
		});
		#end
	}
}
