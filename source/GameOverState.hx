package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class GameOverState extends FlxTransitionableState
{
	override function create()
	{
		var loser:FlxSprite = new FlxSprite(100, 100);
		var loseTex = FlxAtlasFrames.fromSparrow(AssetPaths.lose__png, AssetPaths.lose__xml);
		loser.frames = loseTex;
		loser.animation.addByPrefix('lose', 'lose', 24, false);
		loser.animation.play('lose');
		add(loser);

		var restart:FlxSprite = new FlxSprite(500, 50).loadGraphic(AssetPaths.restart__png);
		restart.setGraphicSize(Std.int(restart.width * 0.6));
		restart.updateHitbox();
		restart.alpha        = 0;
		restart.antialiasing = true;
		add(restart);

		FlxG.sound.music.fadeOut(2, FlxG.sound.music.volume * 0.6);

		FlxTween.tween(restart, {alpha: 1}, 1, {ease: FlxEase.quartInOut});
		FlxTween.tween(restart, {y: restart.y + 40}, 7, {ease: FlxEase.quartInOut, type: PINGPONG});

		super.create();
	}

	private var fading:Bool = false;

	function _restart():Void
	{
		if (fading) return;
		fading = true;
		FlxG.sound.music.fadeOut(0.5, 0, function(_)
		{
			FlxG.sound.music.stop();
			FlxG.switchState(new PlayState());
		});
	}

	override function update(elapsed:Float)
	{
		#if !mobile
		if (FlxG.keys.justPressed.ANY) _restart();
		#end

		#if mobile
		for (touch in FlxG.touches.list)
			if (touch.justPressed) _restart();
		#end

		super.update(elapsed);
	}
}