package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	private var _emitters:Emitters;
	private var _point:FlxPoint;
	private var _sprite:FlxSprite;
	private var _player:FlxSprite;
	private var _targetPlayer:Bool = true;
	private var _info:FlxText;
	
	override public function create():Void
	{
		FlxG.mouse.useSystemCursor = true;
		
		var buttonLabels:Array<String> = [
			"Arc",
			"Coin",
			"Gibs",
			"Rain",
			"Ring",
			"Smoke"
		];
		
		var buttonY:Float = 0;
		var buttons:Array<FlxButton>;
		
		buttons = new Array();
		
		for (i in 0...buttonLabels.length)
		{
			buttons[i] = new FlxButton(0, buttonY, buttonLabels[i]);
			buttons[i].onUp.callback = buttonClick.bind(buttons[i]);
			add(buttons[i]);
			buttonY += buttons[i].height;
		}
		
		var btnToggle:FlxButton = new FlxButton(0, buttonY + 10, "Target Point");
		btnToggle.onUp.callback = toggleTarget.bind(btnToggle);
		add(btnToggle);
		
		_info = new FlxText(btnToggle.width + 10, 0, FlxG.width - btnToggle.width - 20, "Emitters class example using static emitters.\n\nTargeting Player. Use Arrow keys to move player. Click Target button to toggle target between Player or Point.");
		add(_info);
		
		_point = FlxPoint.get(btnToggle.width + ((FlxG.width - btnToggle.width) / 2), (FlxG.height + _info.height) / 2);
		
		_player = new FlxSprite(_point.x - 5, _point.y - 30).makeGraphic(10, 10, 0xFF0099FF);
		_player.maxVelocity.set(160, 160);
		_player.drag.set(_player.maxVelocity.x * 4, _player.maxVelocity.y * 4);
		add(_player);
		
		var pt = new FlxSprite(_point.x, _point.y).makeGraphic(1, 1, 0xFF666666);
		add(pt);
		
		_emitters = new Emitters();
		add(_emitters);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void
	{
		_player.acceleration.set();
		
		if (FlxG.keys.pressed.LEFT)
			_player.acceleration.x = -_player.maxVelocity.x * 4;
		
		if (FlxG.keys.pressed.RIGHT)
			_player.acceleration.x = _player.maxVelocity.x * 4;
		
		if (FlxG.keys.pressed.UP)
			_player.acceleration.y = -_player.maxVelocity.y * 4;
		
		if (FlxG.keys.pressed.DOWN)
			_player.acceleration.y = _player.maxVelocity.y * 4;
		
		super.update(elapsed);	
		
		if (_player.x > (FlxG.width - _player.width))
			_player.x = FlxG.width - _player.width;
		
		if (_player.x < 0)
			_player.x = 0;
		
		if (_player.y > (FlxG.height - _player.height))
			_player.y = FlxG.height - _player.height;
		
		if (_player.y < 0)
			_player.y = 0;
	}
	
	private function buttonClick(button:FlxButton):Void
	{
		switch (button.text)
		{
			case "Arc":
				
				if (_targetPlayer)
					Emitters.explode(Emitters.arc, _player, 10);
				else
					Emitters.explodePoint(Emitters.arc, _point, 10);
				
				_info.text = "Arc is using a makeGraphic for the particles and the emitter is using launchMode = FlxEmitterMode.CIRCLE and launchAngle.set(-120, -60). (launchAngle 0 is East)";
				
			case "Coin":
				
				if (_targetPlayer)
					Emitters.explode(Emitters.coins, _player, 1);
				else
					Emitters.explodePoint(Emitters.coins, _point, 1);
				
				_info.text = "Coin is a class extending FlxParticle and when its lifespan is over, other particles are exploded on it in the kill() function.";
				
			case "Gibs":
				
				if (_targetPlayer)
					Emitters.explode(Emitters.gibs, _player, 6);
				else
					Emitters.explodePoint(Emitters.gibs, _point, 6);
				
				_info.text = "Gibs is using a graphic for the particles.";
				
			case "Rain":
				
				if (_targetPlayer)
					Emitters.explode(Emitters.rain, _player, 20);
				else
					Emitters.explodePoint(Emitters.rain, _point, 20);
				
				_info.text = "Rain is using a makeGraphic for the particles.";
				
			case "Ring":
				
				if (_targetPlayer)
					Emitters.explode(Emitters.ring, _player, 20);
				else
					Emitters.explodePoint(Emitters.ring, _point, 20);
				
				_info.text = "Ring is using a makeGraphic for the particles and the emitter is using launchMode = FlxEmitterMode.CIRCLE.";
				
			case "Smoke":
				
				if (_targetPlayer)
					Emitters.explode(Emitters.smoke, _player, 8);
				else
					Emitters.explodePoint(Emitters.smoke, _point, 8);
				
				_info.text = "Smoke is using a graphic for the particles.";
				
			default:
				
				trace("Unknown Button: " + button.text);
		}
	}
	
	private function toggleTarget(button:FlxButton):Void
	{
		_targetPlayer = !_targetPlayer;
		
		button.text = (_targetPlayer) ? "Target Point" : "Target Player";
		
		_info.text = (_targetPlayer) ? "Targeting Player" : "Targeting Point";
	}
}
