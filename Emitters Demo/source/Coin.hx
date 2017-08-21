package;

import flixel.effects.particles.FlxParticle;

/**
 * Coin Particle.
 * @author Dean
 */

class Coin extends FlxParticle 
{
	public function new()
	{
		super();
		
		var frameRate:Int = 24;
		
		loadGraphic("assets/images/coin.png", true, 10, 10);
		animation.add("spinning", [0, 1, 2, 3, 2, 1], frameRate, true);
		animation.play("spinning");
	}
	
	override public function kill():Void
	{
		Emitters.explodeParticle(Emitters.ring, this, 20);
		Emitters.explodeParticle(Emitters.smoke, this, 1);
		
		super.kill();
	}
}
