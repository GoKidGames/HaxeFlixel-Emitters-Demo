# HaxeFlixel-Emitters-Demo

Demo using static emitters.

Emitters are public static vars defined in class Emitters.hx which also contains static functions to emit on objects, particles or points.

Example usage:


Add to PlayState#create() to create the emitters and add them. (Emitters.hx extends FlxGroup)

<code>var emitters = new Emitters();</code>

<code>add(_emitters);</code>


Now you can use them anywhere in your code.

<code>Emitters.explode(Emitters.gibs, myObject, 20);</code>

<code>Emitters.explodePoint(Emitters.smoke, myPoint, 8);</code>

<code>Emitters.explodeParticle(Emitters.smoke, myParticle, 4);</code>

See Emitters.hx for other functions with notation.
