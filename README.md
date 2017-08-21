# HaxeFlixel-Emitters-Demo

Demo using static emitters.

Try the html5 version:
http://gokidgames.com/EmittersDemo/index.html

Emitters are public static vars defined in class Emitters.hx which also contains static functions to emit on objects, particles or points.

Example usage:

<code>Emitters.explode(Emitters.gibs, myObject, 20);</code>

<code>Emitters.explodePoint(Emitters.smoke, myPoint, 8);</code>

<code>Emitters.explodeParticle(Emitters.smoke, myParticle, 4);</code>

See Emitters.hx for other functions with notation.
