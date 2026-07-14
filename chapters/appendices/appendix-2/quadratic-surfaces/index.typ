
#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Quadratic Surfaces],
  route: "quadratic-surfaces",
  description: "catalogue and characterization of quadratic surfaces",
)


The most general *quadratic surface* (also called a *quadric surface*) in $RR^3$ is given by
$
  A x^2 + B y^2 + C z^2 + D x y + E x z + F y z + G x + H y + I z + J = 0,
$

where $A,B,C,D,E,F,G,H,I,J$ are constants, not all of
$A,B,C,D,E,F$ equal to zero.

This can be written in matrix form as

$
  mat(x, y, z)
  mat(
    A, D/2, E/2;
    D/2, B, F/2;
    E/2, F/2, C
  )
  mat(
    x;
    y;
    z
  )
  +
  mat(G, H, I)
  mat(
    x;
    y;
    z
  )
  + J = 0.
$

The mixed terms $D x y$, $E x z$, and $F y z$ correspond to rotations of
the coordinate axes. By translating and rotating coordinates, every
nondegenerate quadric can be reduced to one of the following standard
forms.

== Ellipsoid

$
  x^2/a^2 + y^2/b^2 + z^2/c^2 = 1
$

== Hyperboloid of One Sheet

$
  x^2/a^2 + y^2/b^2 - z^2/c^2 = 1
$

== Hyperboloid of Two Sheets

$
  -x^2/a^2 - y^2/b^2 + z^2/c^2 = 1
$

== Elliptic Cone

$
  x^2/a^2 + y^2/b^2 - z^2/c^2 = 0
$

== Elliptic Paraboloid

$
  z = x^2/a^2 + y^2/b^2
$

== Hyperbolic Paraboloid

$
  z = x^2/a^2 - y^2/b^2
$

== Elliptic Cylinder

$
  x^2/a^2 + y^2/b^2 = 1
$

== Hyperbolic Cylinder

$
  x^2/a^2 - y^2/b^2 = 1
$

== Parabolic Cylinder

$
  y = x^2/a^2
$

#remark[
  Every quadratic surface is the zero set of a polynomial of degree
  two in the variables $x$, $y$, and $z$.
]
