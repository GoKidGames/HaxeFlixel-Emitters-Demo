# HaxeFlixel-Emitters-Demo

Demo using static emitters.

Try it:

* [Flash](http://gokidgames.com/EmitterDemo/flash/index.html)
* [html5](http://gokidgames.com/EmitterDemo/html5/index.html)
* [html5-webgl](http://gokidgames.com/EmitterDemo/html5-webgl/index.html) (Better performance with browsers that support webgl)

Emitters are public static vars defined in class Emitters.hx which also contains static functions to emit on objects, particles or points.

Example usage:

<code>Emitters.explode(Emitters.gibs, myObject, 20);</code>

<code>Emitters.explodePoint(Emitters.smoke, myPoint, 8);</code>

<code>Emitters.explodeParticle(Emitters.smoke, myParticle, 4);</code>

See Emitters.hx for other functions with notation.
