package mobile;

import flixel.FlxG;
import flixel.FlxCamera;
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

		if (Lib.current.stage == null)
			return;

		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;

		FlxG.scaleMode = new RatioScaleMode();

		FlxG.autoPause = false;
		FlxG.fixedTimestep = false;

		var sw:Int = Lib.current.stage.stageWidth;
		var sh:Int = Lib.current.stage.stageHeight;

		if (FlxG.camera == null)
			FlxG.camera = new FlxCamera();

		var ratio:Float = sw / sh;

		if (ratio >= 2.0)
			FlxG.camera.zoom = 0.70;
		else if (ratio >= 1.8)
			FlxG.camera.zoom = 0.80;
		else
			FlxG.camera.zoom = 0.90;

		FlxG.resizeWindow(sw, sh);
		FlxG.resizeGame(sw, sh);

		#end
	}
}
