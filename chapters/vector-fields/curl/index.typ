#import "../../../lib.typ": *
== Curl

Curl is one of the most important vector field operators that has significant consequences in Physics, such as fluid dynamics.

#definition[
  For a vector field $vb(F) = (M, N)$, curl of $F$ is defined as $ op("curl")(F) = N_x - M_y. $
]

Notice that the curl is $0$ iff $vb(F)$ is conservative.

For a velocity field, _curl_ measures the rotation component of motion at given point. One could verify this through testing the constant vector field, radial vector field, and show that they have $0$ curl. In fact, curl measure twice the angular velocity at a given point.

For a force field, _curl_ measure the torque exerted on a point per unit inertia at that given point.

=== Curl in Space
From now on, we will consider curl in $RR^3$.

Similar to the 2D definition and inspired by the criterion of a conservative vector field (see @def:curl3D), we define curl in 3D as the following.
#definition[
  Fix vector field $vb(F) = P vu(i) + Q vu(j) + R vu(k)$, $ op("curl") = (R_y - Q_z) vu(i) + (P_y - R_x) vu(j) + (Q_x - P_y) vu(k). $
]

Similar to 2D curl, we have that if $vb(F)$ is defined (and differentiable) in a simply-connected region,
$ vb(F) "conservative" <==> op("curl") vb(F) = 0. $

With mild abuse of notations, by treating nabla as a vector of operations, $ nabla = (pdv(, x), pdv(, y), pdv(, z)) , $ and treating a function $f$ as a scalar, $ nabla f = (pdv(f, x), pdv(f, y), pdv(f, z)). $

Then, $ curl vb(F) = mat(vu(i), vu(j), vu(k); pdv(, x), pdv(, y), pdv(, z); P, Q, R; delim: "|") = op("curl"). $

=== Stokes' Theorem
Recall the Green's Theorem in normal form, it allows the conversion between a line integral of work to a surface integral of the two dimensional curl. Similarly, this is achievable for a line integral along a curve in $RR^3$ too, with the Stokes' Theorem.
#theorem[
  Fix a vector field $vb(F)$ in $RR^3$
]
$ integral.cont_c vb(F) dot dif vb(r) = integral.double_S (curl vb(F)) dot hat(vu(n) dif S)). $

