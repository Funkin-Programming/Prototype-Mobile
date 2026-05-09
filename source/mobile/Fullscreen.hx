package mobile;

import flixel.FlxG;
import openfl.display.StageDisplayState;
import openfl.Lib;

class Fullscreen
{
	public static function enable():Void
	{
		#if mobile
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		#end
	}

	public static function disable():Void
	{
		#if mobile
		Lib.current.stage.displayState = StageDisplayState.NORMAL;
		#end
	}

	public static function toggle():Void
	{
		#if mobile
		if (isFullscreen())
			disable();
		else
			enable();
		#end
	}

	public static function isFullscreen():Bool
	{
		#if mobile
		return Lib.current.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
		#else
		return false;
		#end
	}

	public static function apply():Void
	{
		#if mobile
		enable();
		FlxG.scaleMode = new flixel.system.scaleModes.RatioScaleMode(true);
		#end
	}
}
