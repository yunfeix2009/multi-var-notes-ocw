
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Applications of Double Integrals ",
  route: "double-int-app",
)

Just like how one dimensional integration is not constrained to finding the area under a curve, double integrals have applications far beyond finding the volume under a function's surface. Applications of double integrals includes but are not limited to
+ finding the area bounded by a closed loop.

  This is accomplished through $ integral.double_R dif A $. Which is equivalent to finding the volume of the prism with base $R$ and height $1$.
+ finding the mass of non-homogeneous slab.

  Given the density function $rho$, $ M = integral.double_R rho dif A. $
+ finding the average value of $f$ in $R$, continuously.

  $overline(f)_R = 1/op("area") (R) integral.double_R f dif A$
+ finding the weighted average.

  Fix density distribution $delta$, the average of $f$ over $R$ is $ 1/op("mass") integral.double delta f dif A. $
+ finding the center of mass of a flat object.

  Firstly, the center of mass is on the plane of the object, assuming that the object is planar. Let the coordinates of the center of mass be $(overline(x), overline(y))$, the distribution $delta$, then $ cases(x = 1/op("mass") integral.double delta x dif A, y = 1/op("mass") integral.double delta y dif A). $

  Note, this does not directly translate to $overline(r)$ and $overline(theta)$; however, we could still evaluate the integrals in polar coordinates or convert the final $(overline(x), overline(y))$ to $(overline(r), overline(theta))$.

+ finding the moment of inertia wrt an axis perpendicular to a flat object.

  Fix the density distribution $delta$ and distance from the pivot $r$, the moment of inertial of the flat object is $ integral.double_R r^2 delta dif A. $

+ finding the moment of inertia wrt the x-axis
  Fix region $R$ and density distribution $delta$, $ integral.double_R y^2 delta dif x dif y. $

