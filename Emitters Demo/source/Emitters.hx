package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;

/**
 * Emitters - A FlxGroup of public static emitters.
 * Can be used anywhere with Emitters.explode(Emitters.gibs), for example.
 * You can define and add more emitters in this class as needed.
 * @author Dean
 */
class Emitters extends FlxGroup
{
	public static var arc:FlxEmitter;
	public static var coins:FlxEmitter;
	public static var gibs:FlxEmitter;
	public static var rain:FlxEmitter;
	public static var ring:FlxEmitter;
	public static var smoke:FlxEmitter;
	
	public function new()
	{
		super();
		
		arc = new FlxEmitter().loadParticles(new FlxSprite().makeGraphic(2, 2, 0xFF99FF00).graphic, 100);
		arc.launchMode = FlxEmitterMode.CIRCLE;
		arc.launchAngle.set(-120, -60);
		arc.speed.set(64);
		arc.alpha.set(1, 1, 0, 0);
		arc.lifespan.set(2.0);
		
		coins = new FlxEmitter();
		coins.drag.set(32);
		coins.lifespan.set(1);
		coins.maxSize = 50;
		for (i in 0...coins.maxSize)
			coins.add(new Coin());
		
		gibs = new FlxEmitter().loadParticles("assets/images/gibs.png", 50, 16, true);
		gibs.launchMode = FlxEmitterMode.SQUARE;
		gibs.scale.set(0.25, 0.25, 1, 1);
		gibs.alpha.set(1, 1, 0, 0);
		gibs.lifespan.set(1);
		
		rain = new FlxEmitter().loadParticles(new FlxSprite().makeGraphic(2, 2, 0xFF0066CC).graphic, 100);
		rain.launchMode = FlxEmitterMode.SQUARE;
		rain.velocity.set(-20, 20, 20);
		rain.acceleration.set(-20, 20, 20, 40);
		rain.alpha.set(1, 1, 0, 0);
		rain.lifespan.set(2.0);
		
		ring = new FlxEmitter().loadParticles(new FlxSprite().makeGraphic(2, 2, 0xFFFFCC00).graphic, 100);
		ring.launchMode = FlxEmitterMode.CIRCLE;
		ring.speed.set(64);
		ring.alpha.set(1, 1, 0, 0);
		ring.lifespan.set(2.0);

		smoke = new FlxEmitter().loadParticles("assets/images/smoke.png", 100, 16, true);
		smoke.launchMode = FlxEmitterMode.SQUARE;
		smoke.velocity.set(-8, -8, 8, 8);
		smoke.acceleration.set(0);
		smoke.scale.set(1, 1, 1, 1, 2, 3);
		smoke.alpha.set(1, 1, 0, 0);
		smoke.lifespan.set(3.0);
		
		add(arc);
		add(coins);
		add(gibs);
		add(rain);
		add(ring);
		add(smoke);
	}
	
	/**
	 * Emit particles on an object.
	 * @param	emitter     The emitter to emit.
	 * @param	object      The object to focusOn and emit particles from.
	 * @param	frequency   How often to emit a particle. 0 = never emit, 0.1 = 1 particle every 0.1 seconds, 5 = 1 particle every 5 seconds.
	 * @param	quantity    How many particles to emit. Default is 0 and will emit all the particles.
	 */
	public static function emit(emitter:FlxEmitter, object:FlxObject, frequency:Float = 0.1, quantity:Int = 0):Void
	{
		if (emitter == null || object == null)
			return;
			
		emitter.focusOn(object);
		emitter.start(false, frequency, quantity);
	}
	
	/**
	 * Emit particles on an object with explode = true.
	 * @param	emitter     The emitter to emit.
	 * @param	object      The object to focusOn and emit particles from.
	 * @param	quantity    How many particles to emit. Default is 0 and will emit all the particles.
	 */
	public static function explode(emitter:FlxEmitter, object:FlxObject, quantity:Int = 0):Void 
	{
		if (emitter == null || object == null)
			return;
		
		emitter.focusOn(object);
		emitter.start(true, 0.1, quantity);
	}
	
	/**
	 * Centers on a particle and emits other particles.
	 * @param	emitter     The emitter to emit.
	 * @param	object      The particle to center on and emit particles from.
	 * @param	frequency   How often to emit a particle. 0 = never emit, 0.1 = 1 particle every 0.1 seconds, 5 = 1 particle every 5 seconds.
	 * @param	quantity    How many particles to emit. Default is 0 and will emit all the particles.
	 */
	public static function emitOnParticle(emitter:FlxEmitter, particle:FlxParticle, frequency:Float = 0.1, quantity:Int = 0):Void
	{
		if (emitter == null || particle == null)
			return;
		
		var midPoint = particle.getMidpoint();
		
		emitter.setPosition(midPoint.x, midPoint.y);
		emitter.start(false, frequency, quantity);
	}
	
	/**
	 * Explode a particle, rather than an object, and emit particles with explode = true.
	 * @param	emitter     The emitter to emit.
	 * @param	particle    The particle to explode.
	 * @param	quantity    How many particles to emit. Default is 0 and will emit all the particles.
	 */
	public static function explodeParticle(emitter:FlxEmitter, particle:FlxParticle, quantity:Int = 0):Void 
	{
		if (emitter == null || particle == null)
			return;
		
		var midPoint = particle.getMidpoint();
		
		emitter.setPosition(midPoint.x, midPoint.y);
		emitter.start(true, 0.1, quantity);
	}
	
	/**
	 * Emitter will explode on a FlxPoint.
	 * @param	emitter    The emitter to emit.
	 * @param	point      The point to emit particles at.
	 * @param	quantity   How many particles to emit. Default is 0 and will emit all the particles.
	 */
	public static function explodePoint(emitter:FlxEmitter, point:FlxPoint, quantity:Int = 0):Void 
	{
		if (emitter == null || point == null)
			return;
		
		emitter.setPosition(point.x, point.y);
		emitter.start(true, 0.1, quantity);
	}
	
	/**
	 * Emitter will emit on a FlxPoint.
	 * @param	emitter     The emitter to emit.
	 * @param	point       The point to emit particles at.
	 * @param	frequency   How often to emit a particle. 0 = never emit, 0.1 = 1 particle every 0.1 seconds, 5 = 1 particle every 5 seconds.
	 * @param	quantity    How many particles to emit. Default is 0 and will emit all the particles.
	 */
	public static function emitPoint(emitter:FlxEmitter, point:FlxPoint, frequency:Float = 0.1, quantity:Int = 0):Void
	{
		if (emitter == null || point == null)
			return;
		
		emitter.setPosition(point.x, point.y);
		emitter.start(false, frequency, quantity);
	}
	
}