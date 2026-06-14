#import "../../../lib.typ":*
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
  $ integral.cont_c vb(F) dot vu(n) dif s &= integral.cont_c (x vu(i) + y vu(j)) dot vu(n) dif s 
  \ &= integral.cont_c (x vu(i) + y vu(j)) dot (x vu(i) + y vu(j))/a dif s 
  \ &= integral.cont_c (x vu(i) + y vu(j))^2/a dif s
  \ &= integral.cont_c (x^2 + y^2 )/a dif s \ & = integral.cont_c a dif s 
  \ & = a dot op("length") c 
  \ &= 2 pi a^2. 
  $
]


In general, without geometric symmetries, we compute flux in its component form. Like $vu(T) = (dif x, dif y)$, $vu(n) = (dif y, -dif x)$. Thus, if $vb(F) = (P, Q)$, $ integral.cont_c vb(F) dot vu(n) dif s &= integral.cont_c (P, Q) dot (dif y, - dif x) dif x 
\ &= integral.cont_c - Q dif x + P dif y. $

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
  With Green's Theorem, and let $R$ be the region within $c$, $ integral.cont_c vb(F) dot vu(n) dif s &= integral.double_R op("div") vb(F) dif A. $

  $ op("div") vb(F) = pdv(F, P) +  pdv(F, Q) = pdv(x, x) + pdv(y, y) = 1 + 1 = 2. $
  So, $ integral.cont_c vb(F) dot vu(n) dif s = integral.double_R 2 dif A = 2 op("area") dif A = 2 pi a^2. $
] 
#remark[
  With this method, an important insight is obtained: the flux does _not_ depend on the placement of the circle on the plane -- it will be 2 pi a^2 regardless. 
]

In fact, similar to how curl roughly measure how much a field is "rotating" at a certain point, divergence roughly measure how much the flow is expanding at a certain point. 