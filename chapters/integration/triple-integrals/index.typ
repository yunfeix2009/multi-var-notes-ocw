
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Triple Integral",
  route: "triple-int",
)
Now, we add one more dimension to the plane, to study functions of three variables. In differentiation, most objects and theorems are easily generalizable to arbitrary dimensions, with things related to cross product being an exception. However, there are a few things to be said for integration. To start with, we consider integration of functions of three variables, known as triple integral.

Assuming the reader does not have a native way to visualize $RR^4$ and the notion of "volume" in which, we to an extent lose the trend of "area" representation for one-variable integrals and "volume" representation for double integrals.

#definition[
  For a region $R in RR^3$ and a real function of three variables, $f(x, y, z)$, $ integral.triple_R f dif V $ is a triple integral.
]

In Cartesian coordinates, $div V = dif x dif y dif z$.

#example[
  Fix paraboloids $z_1 = x^2 + y^2$ and $z_2 = 4 - x^2 - y^2$. Find the volume of the region bounded by them.
]
#solution[
  With double integrals, $ V = integral.double_R z_1 - z_2 dif A $, where $R$ is the projection of the solid on the $x-y$ plane, which is solvable; however, the volume $V$ could also be written in the form of triple integrals $ V = integral.triple_R' 1 dif V $, where $R'$ is the region bounded by the two paraboloids.

  Let's say we'd like to integrate this purely with triple integrals with Cartesian variables of $x$, $y$, and $z$.

  In this case, it is easiest to integrate $z$ first given that its bounds are clear given $(x, y)$.

  Thus, $ V &= integral_(-sqrt(2))^sqrt(2) integral_(-sqrt(2-x^2))^(sqrt(2-x^2)) integral_(x^2 + y^2)^(4-x^2 - y^2) dif z dif y dif x
  \ &= integral_(-sqrt(2))^sqrt(2) integral_(-sqrt(2-x^2))^(sqrt(2-x^2)) (4 - x^2 - y^2) - (x^2 + y^2) dif y dif x
  \ &= integral_(-sqrt(2))^sqrt(2) integral_(-sqrt(2-x^2))^(sqrt(2-x^2)) (4 - 2x^2 - 2y^2) dif y dif x
  \ &=integral_(-sqrt(2))^sqrt(2) (8 sqrt(2- x^2) - 4x^2 (sqrt(2-x^2)) - 4/3 root(3, 2-x^2)) dif x
  \ &= integral_(-sqrt(2))^sqrt(2) 8/3 root(3, 2-x^2) dif x, $ which could be solved with trig substitution. But if an integral requires trig substitution, it could almost always be done in terms of polar coordinates by exploiting the symmetry. In this case,
  $
    V & = integral_0^(2pi) integral_0^sqrt(2) integral_(r^2)^(4 - r^2) r dif z dif r dif theta \
      & = integral_0^(2pi) integral_0^sqrt(2) (4 - 2 r^2)r dif r dif theta \
      & = integral_0^(2pi) lr((2r^2 - 1/2 r^4)|)_0^sqrt(2) dif theta \
      & = integral_0^(2pi) 2 dif theta \
      & = 2 dot (2pi) \
      & = 4 pi. #qedhere
  $
]
#remark[
  Be careful about the fact that $dif x dif y = r dif r dif theta$.
]
In fact, this set of coordinates (r, theta, z) is _cylindrical coordinates_.

Similar to double integrals with many physical applications, triple integrals are often quite useful as well. Below is a list of quantities that triple integrals is often handy in finding of.
+ mass
  If density is $delta$, then $dif m = delta dif V$, so mass $ M = integral.triple_R delta dif V. $
+ (weighted) average
  of a function $f(x, y, z)$ with density distribution $delta$ over the region $R$ is $ overline(f)_R = 1/op("volume") integral.triple_R delta f dif V. $
+ center of mass
  of a function $f(x, y, z)$ with density distribution $delta$ over the region $R$ is $ (overline(x), overline(y), overline(z)) = (1/op("mass") integral.triple_R delta x dif V, 1/op("mass") integral.triple_R delta y dif V, 1/op("mass") integral.triple_R delta y dif V). $
+ moment of inertia
  By transforming the coordinates, it suffices to find the moment of inertia wrt the $z$-axis. $ I = integral.triple_R delta (x^2 + y^2) dif V. $


Note: In setting bounds of integration, especially for Cartesian coordinates, analytic geometry is a crucial step.
