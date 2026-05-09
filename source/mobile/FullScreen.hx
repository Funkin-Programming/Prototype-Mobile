package mobile;

import flixel.FlxG;
import flixel.system.scaleModes.RatioScaleMode;

import openfl.Lib;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.StageDisplayState;

class FullScreen
{
	public static function apply():Void
	{
		#if mobile

		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;

		FlxG.scaleMode = new RatioScaleMode();

		FlxG.autoPause = false;
		FlxG.fixedTimestep = false;

		#end
	}
}
