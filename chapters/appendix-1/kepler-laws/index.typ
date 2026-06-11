#import "../../../lib.typ": *

== Kepler's Laws and Elliptic Orbits

Planetary motion gives a natural application of parametrized and polar curves.
Kepler's laws say that planets move in ellipses, that the radius vector from the
Sun sweeps out equal areas in equal times, and that the orbital period is tied
to the size of the orbit.

#definition[
  *Kepler's first law.* A planet moves in an ellipse with the Sun at one focus.
]

#definition[
  *Kepler's second law.* If $A(t)$ denotes the area swept out by the radius
  vector from the Sun to the planet, then
  $
  A'(t)
  $
  is constant.
]

#definition[
  *Kepler's third law.* For planets orbiting the same Sun,
  $
  T^2 = k a^3,
  $
  where $T$ is the orbital period, $a$ is the semimajor axis of the orbit, and
  $k$ is the same constant for every planet orbiting that Sun.
]

If an ellipse has semimajor axis $a$ and eccentricity $e$, and if polar
coordinates are measured from a focus, then its equation can be written as
$
r = (a (1 - e^2))/(1 + e cos theta).
$

This is especially useful in celestial mechanics because the Sun is located at a
focus rather than at the center of the ellipse.

The second law is equivalent to the statement that the *areal velocity* is
constant:
$
A'(t) = 1/2 r^2 theta'(t).
$

Therefore a planet moves faster when it is closer to the Sun and slower when it
is farther away.

#remark[
  A centered parametrization of the ellipse is
  $
  x(t) = a cos t, quad y(t) = b sin t.
  $
  To model a planetary orbit with the Sun at a focus, one shifts the origin from
  the center of the ellipse to the focus and then uses the focus-based polar
  equation above.
]
