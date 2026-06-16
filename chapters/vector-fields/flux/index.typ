#import "../../../lib.typ": *
== Flux

We first examine flux in two dimensions, namely in the $x-y$ plane.
#definition[
  For any vector field $vb(F)$ and plane curve $c$, if $vu(n)$ is the normal vector wrt $c$ (by convention, the one that is pointing to the right of a point moving along $c$), the flux of $c$ wrt $vb(F)$ is $ integral.cont_c vb(F) dot vu(n) dif s. $
]

As a comparison to work, $ W = integral.cont_c vb(F) dot dif vb(r) = integral.cont_c vb(F) dot vu(T) dif s, $ where $vu(T)$ is the tangential direction along $c$. However, flux is the $vu(T)$ is replaced with $vu(n)$.

Like how work is interpreted physically where $vb(F)$ is a force field, flux is often interpreted with $vb(F)$ as a velocity field for w fluid. Then, flux represents how much of that fluid is flowing in or out of the membrane modeled with the curve $c$. Conventionally, what flows from the left to right of $c$ is positive and vice versa.

#example[
  Let $c$ be a curve centered at the origin with radius $a$, counterclockwise and $F := x vu(i) + y vu(j)$.
  Find the flux of $c$ wrt $F$.
]<emp:fluxOfCircle>
#solution[
  With the convention of positive to the right, since $c$ is counterclockwise, outward flux is taken to be positive.
  $
    integral.cont_c vb(F) dot vu(n) dif s & = integral.cont_c (x vu(i) + y vu(j)) dot vu(n) dif s \
                                          & = integral.cont_c (x vu(i) + y vu(j)) dot (x vu(i) + y vu(j))/a dif s \
                                          & = integral.cont_c (x vu(i) + y vu(j))^2/a dif s \
                                          & = integral.cont_c (x^2 + y^2 )/a dif s \
                                          & = integral.cont_c a dif s \
                                          & = a dot op("length") c \
                                          & = 2 pi a^2.
  $
]


In general, without geometric symmetries, we compute flux in its component form. Like $vu(T) = (dif x, dif y)$, $vu(n) = (dif y, -dif x)$. Thus, if $vb(F) = (P, Q)$, $ integral.cont_c vb(F) dot vu(n) dif s & = integral.cont_c (P, Q) dot (dif y, - dif x) dif x \
                                      & = integral.cont_c - Q dif x + P dif y. $

Similar to how Green's Theorem provides a double integral based method to compute work, there is an analogous Green's Theorem that converts the computation for flux into the evaluation of a double integral.

#definition[
  Let the divergence of a vector field $vb(F) = (P, Q)$ be $ op("div") (vb(F)) = P_x + Q_y. $
]

#theorem[
  Green's Theorem in normal form states that for a closed curve $c$ enclosing region $R$ then for vector field $vb(F)$ that is defined and is differentiable on $R$, $ integral.cont_c vb(F) dot vu(n) dif s = integral.double_R op("div") (vb(F)) dif A. $
]
#proof[
  The proof here assumes Green's Theorem in tangential form.

  Assume $vb(F) = (P, Q)$, writing the desired formula in component form gives $ integral.cont_c -Q dif x + P dif y = integral.double_R P_x dif x + Q_y dif y $

  Let $ cases(M:= -Q, N := P), $ then with Green's Theorem in tangential form, $integral.cont_c -Q dif x + P dif y &= integral.cont_c M dif x dif y
  \ &= integral.double_R N_x dif x - M_y dif y
  \ &= integral.double_R P_x dif x - (-Q)_y dif y
  \ & = integral.double_R P_x dif x + Q_y dif y. #qedhere$
]

Here we present an example of using Green's Theorem to find the flux by providing a solution to @emp:fluxOfCircle with Green's Theorem in normal form.
#solution[
  With Green's Theorem, and let $R$ be the region within $c$, $ integral.cont_c vb(F) dot vu(n) dif s & = integral.double_R op("div") vb(F) dif A. $

  $ op("div") vb(F) = pdv(F, P) + pdv(F, Q) = pdv(x, x) + pdv(y, y) = 1 + 1 = 2. $
  So, $ integral.cont_c vb(F) dot vu(n) dif s = integral.double_R 2 dif A = 2 op("area") dif A = 2 pi a^2. $
]
#remark[
  With this method, an important insight is obtained: the flux does _not_ depend on the placement of the circle on the plane -- it will be 2 pi a^2 regardless.
]

In fact, similar to how curl roughly measure how much a field is "rotating" at a certain point, divergence roughly measure how much the flow is expanding at a certain point.


=== Flux in Space
From now on, we will consider flux in $RR^3$.

Rather than considering how much liquid is flowing "through" a curve, we consider how much liquid a flowing through a surface.
#definition[
  Formally, for a vector field $vb(F)$ and surface $S$, let $vu(n)$ represent the unit normal vector wrt $S$ at a certain point, the flux of $vb(F)$ is $ integral.surf_S vb(F) dot vu(n) dif S. $ ]

There is one thing that must be taken care of. In 2D flux, the convention deems the normal to the right of a moving point on the curve as positive; however, on a surface, it must be stated explicitly which of the two normal vectors is taken as positive, which is termed "orientation" of the surface. Usually, the direction pointing out of the surface is taken as positive.

As a notation, $dif (vb(S)) = vu(n) dot vb(S)$.

#example[
  Fix vector field $vb(F) = (x, y, z)$, find the flux through the unit sphere centered at the origin.
]
#solution[
  For a point $(x_0, y_0, z_0)$ on the unit sphere, $vu(n) = (x_0, y_0, z_0)$. Thus, let $S$ be the surface of the unit sphere, the flux is $ integral.surf_S vb(F) dot vu(n) dif S & = integral.surf_S (x, y, z) dot (x, y, z) dif S \
                                        & = integral.surf_S x^2 + y^2 + z^2 dif S \
                                        & = integral.surf_S dif S \
                                        & = op("area") \
                                        & = 4 pi. #qedhere $
]

#example[
  Let $S$ be a unit sphere of radius $a$ centered as the origin and $R$ be its interior. Fix the vector field $vb(H) = z vu(k)$, find the flux of $vb(H)$ through S.
]<emp:motivatingDivergence>

#solution[
  Flux is $ integral.surf_S vb(H) dot (x, y, z)/a dif S &= integral.surf_S z^2/a dif S
  // \ &= integral.triple_R
  \ &= 1/a integral_0^(2pi) integral_0^pi (a cos Phi)^2 a^2 sin Phi dif Phi dif theta
  \ &= a^3 integral_0^(2pi) integral_0^pi cos^2 Phi sin Phi dif Phi dif theta. $
  Let $u:= cos Phi$, $dif u = - sin Phi dif Phi$, then $ integral cos^2 Phi sin Phi dif Phi & = - u^3/3 + C \
                                     & = - (cos Phi)^3/3 + C. $
  So, flux becomes $ a^3 integral_0^(2pi) lr([- (cos Phi)^3/3] |)^pi_0 dif theta & = 2 pi a^3 lr([- (cos Phi)^3/3] |)^pi_0 \
                                                              & = 4/3 pi a^3 $
]
#remark[
  Be careful not to assume $dif S = dif Phi dif theta$.

  Also, notice that the answer is indeed the surface area of the sphere, we will see why exactly it must be with divergence theorem (#text(red)[trust imma insert label here later]).
]
surface integral
$
  vu(n) dot Delta S &= (((x+ Delta x), y, f(x+Delta x, y) - (x, y, f(x, y))) times ((x, y+ Delta y, f(x, y + Delta y)) - (x, y, f(x, y))
  \ &= (Delta x, 0, f(x + Delta x, y) - f(x, y)) times (0, Delta y, f(x, y + Delta y) - f(x + y))
  \ & approx (Delta x, 0, f_x Delta x) times (0, Delta y, f_y Delta y)
  \ &= (1, 0, f_x) times (0, 1, f_y) Delta x Delta y
  \ &= abs(mat(vu(i), vu(j), vu(k); 1, 0, f_x; 0, 1, f_y)) Delta x Delta y
  \ &= (-f_x, -f_y, 1) Delta x Delta y
$
(with $vu(n)$ up)
$
  vu(n) dot dif S & = \
                  & = plus.minus (-f_x, f_y, 1) dif x dif y
$
#example[
  Flux of $vb(F) = z vu(k)$ through the portion of $z = x^2 + y^2$ that lies above the unit disc.
]
#example[
  Flus is $ integral.double_S vb(F) dot dif vb(S) & =
                                          integral.double_DD z vu(k) dot (-2x, -2y, 1) dif x dif y \
                                        & = integral.double_DD z dif x dif y \
                                        & = integral.double_DD x^2 + y^2 dif x dif y \
                                        & = integral_0^(2 theta) integral_0^1 r^3 dif r dif theta \
                                        & = integral_0^(2pi) 1/4 dif theta \
                                        & = pi/2. #qedhere $
]

Now we consider the case where $z$ cannot conveniently be expressed in $x$ and $y$, but we could parametrize the surface in terms of two variables, meaning $ S := cases(x = x(u, v), y = y(u, v), z = z(u, v)). $


Now, in order to compute the flux through such surfaces, representation of $dif vb(S) = vu(n) dot S$ in $dif u$ and $dif v$ is crucial.

Let $vb(r) = (x, y, z)$, then $ dif vb(S) & = (vb(r)_u dif u) times (vb(r)_v dif v) \
          & = plus.minus (vb(r)_u times vb(r)_v) dif u dif v, $ with the sign depending on the direction of $vu(n)$.

In the case that parametrizing the surface is still not an option; however, the normal vector is known (for example through gradient). For small enough portion of the surface that could be treated as a slanted plane, forming an angle $alpha$ with the $x-y$ plane, then geometrically we have $dif A = dif S cos alpha$. However, the angle between two planes is equal to the angle between their normal vectors, so $ cos alpha = (vu(n) dot vu(k))/(norm(vu(n)) norm(vu(k)) = vu(n) dot vu(k). $
Thus, $ vu(n) dif S = vu(n) dif A / cos alpha = vu(n)/(vu(n) dot vu(k)) dif A, $ where $dif A$ could be $dif x dif y$ or as it is in any other coordinate systems.

Note that the $vu(n)$ cannot be canceled here, as the denominator is a scalar.

To verify this method, we will use it to show the formula we had when $z$ is explicit in terms of $x$ and $y$.
#example[
  Find $dif vb(S)$ given $ z- f(x, y) = 0. $
]
#solution[
  Let $g(x, y, z) = z - f(x, y)$, then
  $
    dif vb(S) & = vu(n)/(vu(n) dot vu(k)) dif A \
              & = (nabla g)/(nabla g dot vu(k)) dif A \
              & = (-f_x, -f_y, 1)/1 dif A \
              & = (-f_x, -f_y, 1) dif x dif y.
  $
]
=== Divergence Theorem


Now that we have discussed how to compute surface integrals, we consider how to avoid them, with Divergence Theorem.

First, we looks at what is divergence.
With mild abuse of notations, by treating nabla as a vector of operations, $ nabla = (pdv(, x), pdv(, y), pdv(, z)) , $ and treating a function $f$ as a scalar, $ nabla f = (pdv(f, x), pdv(f, y), pdv(f, z)). $

Taking this further, if $f(x, y, z) = (P, Q, R)$, then $ nabla dot f = (pdv(P, x), pdv(Q, y), pdv(R, z)) = op("div") f. $
#theorem[
  The Divergence Theorem (sometimes referred to as the Gauss-Green Theorem) states that, for a simply connected, bounded region $D$, with surface $S$ and a function defined and differentiable on it, $vb(F)$, then
  $ integral.surf_S vb(F) dot dif vb(S) = integral.triple_D op("div") vb(F) div V, $
  where $op("div") (P vu(i) + Q vu(j) + R vu(k)) = P_x + Q_y + R_k.$
]
#proof[
  Like how the Divergence Theorem is a generalization of the two-variable Green's Theorem in normal form, our proof's shall follow the same outline. First observe that it suffices to show one component, here we pick $z$, or $ integral.surf_S R dot dif vb(S) &= integral.triple_D nabla dot R dif V 
  \ &= integral.triple_D R_z dif V.
   $
  Next, notice that the flux of a region is equal to the sum of the flux of two sub-regions whose union is the original region. Therefore, it suffices to consider one of these sub-regions that is vertically simple, meaning that its bottom surface is $z = z_1(x, y)$ and the top is a surface $z = z_2(x, y)$, else bounded by vertical faces. 

  Fix one such region $D$, projecting $U$ onto the $x-y$ plane, we have $
    integral.triple_D R_z dif V &= integral.double_U (integral_(z_1(x, y))^(z_2(x, y)) R_z dif z) dif A 
    \ &= integral.double_U (R(x, y, z_1(x, y)), R(x, y, z_2(x, y))) dif A
  $

  On the other hand, since $
    dif vb(S) = (- pdv(z, x), - pdv(z, y), 1) dif x dif y
  $, the left side of the theorem becomes $
    integral.surf_S R dot dif vb(S) = integral.surf_"top" R dot dif vb(S) + integral.surf_"bottom" R dot dif vb(S) + integral.surf_"sides" R dot dif vb(S) 
    \ &= integral.surf_U R dot (- pdv(z_2, x), - pdv(z_2, y), 1) dif x dif y + integral.surf_U R dot -(- pdv(z_1, x), - pdv(z_1, y), 1) dif x dif y + 0 
    \ &= integral.surf_U R dif x dif y - integral.surf_U R dif x dif y 
    \ &= integral.surf_U R(x, y, z_2(x, y)) dif x dif y - integral.surf_U R(x, y, z_1(x, y)) dif x dif y 
    \ &= integral.double_U (R(x, y, z_1(x, y)), R(x, y, z_2(x, y))) dif A
    \ &= integral.triple_D R_z dif V. #qedhere
  $

]
#remark[
  In general, in order to apply Divergence to a region that is not simply connected, we decompose the region into simply connected regions. 
]

Now, we explain the previous suspicious-looking $4/3 pi a^3$, see <emp:motivatingDivergence>, with Divergence Theorem.
#solution[
  $
    integral.surf_S vb(F) dot dif vb(S) & = integral.triple_D op("div") vb(F) div V \
                                        & = integral.triple_D 1 dif V \
                                        & = op("volume") (D) \
                                        & = 4/3 pi a^3.
  $
]


=== Diffusion Equations

One consequential application of the Divergence Theorem is in solving diffusion equations, that governs how some substance "spread out" when situated in a static fluid. 

Some examples of diffusion are smoke in the air, dye in water, and heat (see @eq:heat). 

To model this, let the concentration at a given point $(x, y, z)$ and time $t$ be $u(x, y, z, t)$. 
#theorem[
  If the starting concentration is described by $pdv(u, x), pdv(u, y), pdv(u,z)$, we aim to find how the concentration at a point changes through time, $pdv(u, t)$. 

$ pdv(u, t) = k (pdv(u, x, 2) + pdv(u, y, 2) + pdv(u, z, 2)). $
] 
#definition[
Define operator laplacian (del, says Denis) $ Delta u = nabla^2 u = nabla dot nabla u, $
]
then $ pdv(u, t) = k nabla^2 u. $

#proof[
  Let $vb(F)$ denote the flow of the substance, say dye being defused, since dye flows from high concentration to low concentration, $ op("dir")(vb(F)) = op("dir") (- nabla u). $

  Here we invoke a result from thermodynamics that $vb(F)$ is proportional to $- nabla u$, that makes sense from dimensional analysis. Thus, $ vb(F) = - k nabla u. $

  To relate $vb(F)$ and $pdv(u, t)$, we consider a region $D$ in space with boundary $S$. The flux out of $D$ through $S$ is $ integral.surf_S vb(F) dot vu(n) dif S = - dv(, t) (integral.triple_D u dif V) $

  However, with the Divergence Theorem, $ integral.surf_S vb(F) dot vu(n) dif S &= integral.triple_D nabla dot vb(F) dif V. $
  So, $ integral.triple_D op("div") vb(F) dif V &= - dv(, t) integral.triple_D u dif V 
  \ &= integral.triple - pdv(u, t) dif V. $
  Notice that taking the differential operator could be taken into the integrals as $(u + v)' = u' + v'$. 

  Since this equation is true for any region $D$, $ div vb(F) = - pdv(u, t). $

  So, $
  pdv(u, t) = - div vb(F) = - k nabla^2 u. 
  $
]
