
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Spherical Coordinates and Surface Area",
  route: "spherical",
)
#definition[
  Spherical coordinates is a way of representing a point in $RR^3$. Specifically, the distance from the point to the origin is $rho in [0, oo)$ and the angle from angle downwards from the $+z$-axis, $Phi in [0, pi]$, and $theta$ the angle from $+x$-axis towards $+y$-axis, $theta in [0, 2 pi]$.
]

Another way to think about spherical coordinates is to imagine that it is applying $r-theta$ on the $r-z$ plane. Formally, $ cases(z = rho cos Phi, r = rho sin Phi). $ Thus, $ cases(x = r sin theta = rho sin Phi sin theta, y = r cos theta = rho sin Phi cos theta, z = z). $

#example[
  $rho = 1$ is the unit sphere centered at the origin; $Phi = pi/4$ is a cone.
]

Being in the integration section, we are interested in how $dif V$ is related to $dif rho dif theta dif Phi$.

With Denis's diagram,
#align(center)[
  #image("/assets/image-2.png")
]
easy to see that, with a small change in $rho, theta$, and $Phi$, the change in volume is a "rectangular" piece of a thin spherical shell. The thickness is $dif rho$. The height is $rho dif Phi$. The length is $rho sin Phi dif theta$. Thus, $ dif V = rho^2 sin Phi dif rho dif Phi dif theta. $

#example[
  Find the volume of the portion of the unit sphere centered at the origin that lies above the plane $z = 1/sqrt(2)$.
]
#solution[
  Of course, if we were to use triple integral, which we will, any coordinate system should do the job; however, spherical coordinates is arguably the simplest among them all.

  Notice that the region is $ cases(Phi in [0, pi/4], theta in [0, 2pi], rho in [1/(sqrt(2) cos Phi), 1]). $

  Hence, the volume $ V & = integral_0^(2 pi) integral_(0)^(pi/4) integral_(1/(sqrt(2) cos Phi))^1 rho^2 sin Phi dif rho dif Phi dif theta \
    & = integral_0^(2pi) integral_(0)^(pi/4) (1- 1/(2 sqrt(2) cos^3 Phi))/3 sin Phi dif Phi dif theta $
  From here, the integration is just trig substitution. The rest of the calculation is omitted, though the final answer is $ V = (2 pi)/3 - (5 pi)/(6 sqrt(2)). $
]

Besides the classic applications such as finding the mass, moment of inertia, spherical coordinates makes finding the average distance of points in a solid to the origin easier since everything is in terms of $rho$. Furthermore, there is a "new" application of spherical coordinates in integration.

=== Gravitational Attraction

Newtonian gravitational force could be described as  $ vb(F) = (G M m (x, y, z))/rho^3. $

So, for a solid in region $R$ with density $delta$, the $vb(F)_g$ it exerts on a point mass with mass $m$ centered at the origin is $ integral.triple_R (G m delta (x, y, z))/rho^3 dif V. $

If the solid is symmetric wrt one axis, then spherical coordinates comes convenient in finding $vb(F)_g$. By placing the solid on the $z$-axis, keeping its distance to the origin fixed, the only component of the force is in the $z$ direction.

$
  vb(F) & =integral.triple_R (G m delta (x, y, z))/rho^3 dif V \
        & = G m integral.triple_R (delta z)/rho^3 dif V \
        & = G m integral.triple_R ( delta rho cos Phi)/rho^3 dif V \
        & = G m integral.triple_R (delta rho cos Phi)/rho^3 rho^2 sin Phi dif V \
        & = G m integral_R delta cos Phi sin Phi dif V
$

#theorem[
  (newton) The gravitational attraction from a sphere with uniform density (although as long as its density only depends on the radial component also suffices) is equivalent to that of a point mass placed at the center of the sphere.
]

This fact is a direct consequence of the cancellation of $rho$ from the expression. The deeper reason of this is the fact that the inverse square of the decay of gravitational force cancels the square growth of the surface area.

#example[
  (Practice Final P12) A solid hemisphere of radius $1$ has its lower flat base on the $x y$-plane and center at the origin. Its density function is $delta = z$. Find the force of gravitational attraction it exerts on a unit mass at the origin.
]
#solution[
  For a small enough volume $dif V$, the force $ vb(F)_g &= G m delta vb(r)/norm(r)^3 dif V
  \ &= G m delta ((rho sin Phi cos theta, rho sin Phi sin theta, rho cos Phi))/rho^3 rho^2 sin Phi dif rho dif Phi dif theta
  \ &= G m delta (sin Phi cos theta, sin Phi sin theta, cos Phi) sin Phi dif rho dif Phi dif theta. $
  Also, by symmetry, the final force is in $vu(k)$ direction. So, $ vb(F)_sigma & = integral_0^(2pi) integral_0^(pi/2) integral_0^1 G m delta sin Phi cos Phi dif rho dif Phi dif theta \
              & = G integral_0^(2pi) integral_0^(pi/2) integral_0^1 sin Phi cos^2 Phi rho dif rho dif Phi dif theta \
              & = G 2pi integral_0^(pi/2) 1/2 sin Phi cos^2 Phi dif Phi dif theta \
              & = G pi lr([(cos^3 Phi)/3]|)^(pi/2)_0 \
              & = G pi dot 1/3 \
              & = (G pi)/3. #qedhere $
]
