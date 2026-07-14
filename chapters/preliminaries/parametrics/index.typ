
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Parametric Equations",
  route: "parametrics",
)
Previously, we described lines in $RR^3$ as intersections of planes.
However, we may also describe a line as the trajectory of a moving point.

Suppose a line passes through the points
$
  Q_0 = (-1, 2, 2)
$
and
$
  Q_1 = (1, 3, -1).
$

Let $Q(t)$ denote a point moving along the line such that
$
  Q(0) = Q_0
$
and
$
  Q(1) = Q_1.
$

Then
$
  (Q(t) - Q_0) = t (Q_1 - Q_0).
$

Since
$
  (Q_1 - Q_0) = (1, 3, -1) - (-1, 2, 2) =
  (2, 1, -3),
$
we obtain
$
  Q(t) = Q_0 + t (Q_1 - Q_0).
$

Hence
$
  Q(t) = (-1, 2, 2) + t(2, 1, -3).
$

#theorem[
  The parametric equations of this line are
  $
    x(t) = -1 + 2t,
  $
  $
    y(t) = 2 + t,
  $
  $
    z(t) = 2 - 3t.
  $
]

#remark[
  In general, if a line passes through a point $P_0 = (x_0, y_0, z_0)$ and has
  direction vector $vb(v) = (a, b, c)$, then a parametric equation for the line is
  $
    Q(t) = P_0 + t vb(v).
  $

  Equivalently,
  $
    x = x_0 + a t,
  $
  $
    y = y_0 + b t,
  $
  $
    z = z_0 + c t.
  $

  The constant terms determine a point on the line, while the coefficients of $t$
  determine its direction.
]

#example[Cycloid][
  A circle of radius $a$ rolls along the $x$-axis without slipping. Find a
  parametric equation for the path traced by a point on the rim of the circle.
  Describe the main geometric features of the resulting curve.
]

#solution[
  Let $t$ be the angle through which the circle has rotated. Since the circle
  rolls without slipping, the distance traveled by its center is equal to the
  arc length $a t$. Therefore the center of the circle is at
  $
    C(t) = (a t, a).
  $

  Relative to the center, the marked point begins at $(0, -a)$ and rotates
  clockwise through angle $t$, so its displacement from the center is
  $
    (-a sin t, -a cos t).
  $

  Hence the traced curve is
  $
    Q(t) = (x(t), y(t)) = (a (t - sin t), a (1 - cos t)).
  $

  This curve is called a *cycloid*.

  For $0 <= t <= 2 pi$, one obtains a single arch of the cycloid. The arch
  begins at $(0,0)$, ends at $(2 pi a, 0)$, and reaches its highest point
  $
    Q(pi) = (pi a, 2 a).
  $

  The velocity vector is
  $
    Q'(t) = (a (1 - cos t), a sin t),
  $
  so for $t != 2 pi k$ the slope of the tangent line is
  $
    (y'(t))/(x'(t)) = (a sin t)/(a (1 - cos t))
    = sin t/(1 - cos t)
    = cot(t/2).
  $

  Thus the tangent is horizontal at the top point $t = pi$, while the endpoints
  $t = 2 pi k$ are cusps.

  The arc length of one arch is
  $
    integral_0^(2 pi) norm(Q'(t)) dif t
    =
    integral_0^(2 pi) 2 a sin(t/2) dif t
    =
    8 a.
  $

  The area under one arch is
  $
    integral_0^(2 pi) y(t) x'(t) dif t
    =
    integral_0^(2 pi) a^2 (1 - cos t)^2 dif t
    =
    3 pi a^2.
  $
]
