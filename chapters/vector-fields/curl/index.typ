#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Curl",
  route: "curl",
)

Curl is one of the most important vector field operators that has significant consequences in Physics, such as fluid dynamics.

#lbl(<def:vector-fields-curl-1>, definition[
  For a vector field $vb(F) = (M, N)$, curl of $F$ is defined as $ op(bold("curl"))(vb(F)) = N_x - M_y. $
])

Notice that the curl is $0$ iff $vb(F)$ is conservative.

For a velocity field, _curl_ measures the rotation component of motion at given point. One could verify this through testing the constant vector field, radial vector field, and show that they have $0$ curl. In fact, curl measure twice the angular velocity at a given point.

For a force field, _curl_ measure the torque exerted on a point per unit inertia at that given point.

=== Curl in Space
From now on, we will consider curl in $RR^3$.

Similar to the 2D definition and inspired by the criterion of a conservative vector field (see @def:curl3D), we define $op(bold("curl"))$ in 3D as the following.



#lbl(<def:vector-fields-curl-2>, definition[
  Fix vector field $vb(F) = P vu(i) + Q vu(j) + R vu(k)$, $ op(bold("curl")) = (R_y - Q_z) vu(i) + (P_y - R_x) vu(j) + (Q_x - P_y) vu(k). $
])

Similar to 2D curl, we have that if $vb(F)$ is defined (and differentiable) in a simply-connected region,
$ vb(F) "conservative" <==> op(bold("curl")) vb(F) = 0. $

With mild abuse of notations, by treating nabla as a vector of operations, $ grad = (pdv(, x), pdv(, y), pdv(, z)) , $ and treating a function $f$ as a scalar, $ grad f = (pdv(f, x), pdv(f, y), pdv(f, z)). $

Then, $ curl vb(F) = mat(vu(i), vu(j), vu(k); pdv(, x), pdv(, y), pdv(, z); P, Q, R; delim: "|") = op(bold("curl")). $

#lbl(<ex:vector-fields-curl-1>, example[
  (Practice Final P14) 

  a) Let $vb(F) = a y^2 vu(i) + 2y(x + z) vu(j) + (b y^2 + z^2) vu(k)$. For what values of the constants $a$ and $b$ will $vb(F)$ be conservative? 

  b) Using these values, find a function $f (x, y, z) $ such that $vb(F) = nabla f$.

  c) Using these values, give the equation of a surface S having the property : $integral_P^Q vb(F) dif vb(r) = 0$ for any two points P and Q on the surface S.
])
#solution[
  (a) $vb(F)$ is conservative iff $ curl vb(F) &= mat(delim:"|", vu(i), vu(j), vu(k); pdv(, x), pdv(, y), pdv(, z); a y^2, 2y(x+z), b y^2 + z^2) 
  \ &= (2 b y - 2y) vu(i) + 0 vu(j) + (2y + 2 a y) vu(k) = 0
  \ & ==> a = b = 1. $
  (b) With differentials, $ dif vb(F) = y^2 dif x + 2y(x+z) dif y + (y^2 + z^2) dif z. $
  So, $ f &= 2 x y^2 + g(y, z)
  \ &= x y^2 +  z y^2 + g(z) 
  \ &= (x + z) y^2 + z^3/3 + C. $
  (c) $P$ and $Q$ need to be on a level surface of $f$, so $f(x, y, z) = c$, meaning $S := (x + z)y^2 + z^3 = C$
]

=== Stokes' Theorem
Recall the Green's Theorem in normal form, it allows the conversion between a line integral of work to a surface integral of the two dimensional curl. Similarly, this is achievable for a line integral along a curve in $RR^3$ too, with the Stokes' Theorem.
#lbl(<thm:vector-fields-curl-1>, theorem[
  Fix a vector field $vb(F)$ in $RR^3$ and a surface $S in RR^3$ bounded by the curve $c$, $ integral.cont_c vb(F) dot dif vb(r) = integral.double_S (curl vb(F)) dot vu(n) dif S. $
])

Conventionally, following that counterclockwise curl is positive, when traveling along the curve $c$, if the surface if on the left side, then $vu(n)$ points up. 
Interesting, for certain surfaces, like a mobius strip, it is impossible to orient it consistently. Luckily for us, however, topologists state that the bounding curve of a non-orientable surface also bounds a orientable surface. 

One consequence of Stokes' Theorem is that the integration of curl through any two surfaces bounded by the same curve are equal. In fact, this is a consequence of $div (curl vb(F)) = 0$. 
#proof[
  For two surfaces $S_1$ and $S_2$, both bonded by $c$, let $S := S_1 - S_2$, $ integral.surf_S_1 curl(F) dif vb(S) - integral.surf_S_2 curl(F) dif vb(S) &= integral.surf_S curl(F) dif vb(S) 
  \ &= integral.triple_D div (curl vb(F)) dif V 
  \ &= 0,
  $ where $D$ is the region bounded by the closed surface $S$, which justifies the application of the Divergence Theorem. Moreover, $ div (curl vb(F)) &= div ((R_y - Q_z) vu(i) + (P_z - R_x) vu(j) + (Q_x - P_y)) 
  \ &= R_(y x) - Q_(z x) + P_(z y) - R_(x y) + Q_(x z) - P_(y z)
  \ &= 0. #qedhere $
]
#lbl(<rem:vector-fields-curl-1>, remark[
  For "actual" vectors (with real components rather than differential operators), $vb(u)$ and $vb(v)$, $ vb(u) dot (vb(u) times vb(v)) = 0, $ as they are orthogonal. 
])

=== Path Independence in 3D

#lbl(<def:vector-fields-curl-3>, definition[
  A region $D in RR^3$ is _simply connected_ iff $ forall c in D and c "is closed", exists S "bounded by" c and S in D. $
])
In fact, this definition is different from "the interior of every surface in $D$ is also in $D$." For example, the region $RR^3 without (0, 0, 0)$ is simply connected, as for any curve in $RR^3 without (0, 0, 0)$, there is a surface bounded by it that does not contain the origin. However, the region that is $RR^3$ with the $z$-axis removed is _not_ simply connected, as there is no surface bounded by  $partial DD$ that does not intersect the $z$-axis. 

Like 2D, if $vb(F)$ is a gradient field, $curl F = 0$, since $vb(F)$ satisfies the criterion which is directly from a gradient field. 

#lbl(<thm:vector-fields-curl-2>, theorem[
  If $vb(F)$ is defined on a simply connected region and $curl vb(F) = 0$, then $vb(F)$ is a gradient field, or $integral.cont_c vb(F) dot dif vb(r)$ is path-independent.  
])
#proof[
  For two arbitrary points in the region, $P_0$ and $P_1$, connected by two curves $c_1$ and $c_2$, it suffices to show $ integral_c_1 vb(F) dot dif vb(r) - integral_c_2 vb(F) dot dif vb(r) = 0. $ 
  Let $c:= c_1 - c_2$,  $ integral_c_1 vb(F) dot dif vb(r) - integral_c_2 vb(F) dot dif vb(r) &= integral.cont_c vb(F) dot dif vb(r). $ Since $vb(F)$ is defined on a simply connected region, there exists a surface bounded by $c$ that also lies in the region, let it be $S$; therefore, Stokes' Theorem is applicable. 

  $ integral.cont_c vb(F) dot dif bold(r) = integral.double_S curl vb(F) dif vb(S) = 0. $

  Therefore, $vb(F)$ is path-independent, the function $ f(P) = integral_(P_0)^P vb(F) dot dif vb(r) $ is well-defined, and $vb(F) = grad f$, meaning $vb(F)$ is a gradient field. 
]

#lbl(<ex:vector-fields-curl-2>, example[
  (Practice Final P17) An xz-cylinder in 3-space is a surface given by an equation f (x, z) = 0 in x and z alone; its section by any plane y = c perpendicular to the y-axis is always the same xz-curve.
Show that if $vb(F) = z^2 vu(i) + y^2 vu(j) + x z vu(k)$, then $integral.cont_C vb(F) dot dif vb(r) = 0$ for any simple closed curve C lying on an xz-cylinder.
])
#solution[
  By Stokes' Theorem, $ integral.cont_C vb(F) dot dif vb(r) &= integral.surf_S curl vb(F) dif vb(S). $
  While $ curl vb(f) &= mat(delim:"|", vu(i), vu(j), vu(k); pdv(, x), pdv(, y), pdv(, z); z^2, y^2, x z) = z vu(j). 
  $

  So, work is $ integral.surf_S z vu(j) dot vu(n) dif S . $ But $vu(n)$ has no $y$ component due to symmetry, the integrand is therefore $0$. 
]
