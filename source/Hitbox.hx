package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;

class Hitbox extends FlxGroup
{
	public var buttonLeft:FlxSprite;
	public var buttonDown:FlxSprite;
	public var buttonUp:FlxSprite;
	public var buttonRight:FlxSprite;

	public function new()
	{
		super();

		buttonLeft  = createHint(0,                                   0, Std.int(FlxG.width / 4), FlxG.height, 0xFFC24B99);
		buttonDown  = createHint(FlxG.width / 4,                      0, Std.int(FlxG.width / 4), FlxG.height, 0xFF00FFFF);
		buttonUp    = createHint(FlxG.width / 2,                      0, Std.int(FlxG.width / 4), FlxG.height, 0xFF12FA05);
		buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, Std.int(FlxG.width / 4), FlxG.height, 0xFFF9393F);

		add(buttonLeft);
		add(buttonDown);
		add(buttonUp);
		add(buttonRight);
	}

	function createHint(X:Float, Y:Float, Width:Int, Height:Int, Color:Int):FlxSprite
	{
		var hint = new FlxSprite(X, Y);
		hint.makeGraphic(Width, Height, Color);
		hint.alpha = 0.00001;
		hint.scrollFactor.set();
		return hint;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (touch.overlaps(buttonLeft))  _press(buttonLeft);
				if (touch.overlaps(buttonDown))  _press(buttonDown);
				if (touch.overlaps(buttonUp))    _press(buttonUp);
				if (touch.overlaps(buttonRight)) _press(buttonRight);
			}
			if (touch.justReleased)
			{
				_release(buttonLeft);
				_release(buttonDown);
				_release(buttonUp);
				_release(buttonRight);
			}
		}
	}

	function _press(hint:FlxSprite):Void
	{
		FlxTween.cancelTweensOf(hint);
		FlxTween.tween(hint, {alpha: 0.6}, 0.08, {ease: FlxEase.circOut});
	}

	function _release(hint:FlxSprite):Void
	{
		FlxTween.cancelTweensOf(hint);
		FlxTween.tween(hint, {alpha: 0.00001}, 0.12, {ease: FlxEase.circIn});
	}

	public function isPressed(hint:FlxSprite):Bool
	{
		for (touch in FlxG.touches.list)
			if (touch.pressed && touch.overlaps(hint))
				return true;
		return false;
	}
}