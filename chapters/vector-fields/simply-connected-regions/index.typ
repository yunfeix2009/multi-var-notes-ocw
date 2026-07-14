#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Simply Connected Regions",
  route: "simply-connected-regions",
)

One of Green's Theorem's limitation is that the vector field $vb(F)$ must be defined for every point in $R$.

#lbl(<emp:badHoles>, example[
  (Pset) Fix $vb(F) = (-y vu(i) + x vu(j))/(x^2 + y^2)$, devise a way to find line integrals on the plane.
])

I will no go into the details, but observe that $vb(F)$ is defined and differentiable on $RR without 0$. In fact, the curl at every point but the origin is $0$. Thus, for any curve that does not enclose the origin, the work along it is $0$. However, Green's Theorem, at least in the form we currently use it in, is ineffective against curves that enclose the origin.

To fix this, consider a region $R$ bounded by two curves that both enclose the origin, where $c_1$ is the outer boundary of $R$ and $c_2$ is the inner boundary of $R$. Assume $vb(F)$ is defined and is differentiable on $R$ and both $c_1$ and $c_2$ are counterclockwise, then we have the following extension of Green's Theorem: $ integral.cont_c_1 vb(F) dot dif vb(r) - integral.cont_c_2 vb(F) dot dif vb(r) = integral.double_R op("curl") vb(F) dif A. $

The argument becomes transparent upon the geometry, meaning that I will have to steal Denis's chalkboard for the first time.
#figure-wrapper[
  #figure(
    image("/assets/image-1.png"),
  )
]
By going around the outer curve, then to the inner curve, then back at the outer curve, the curve in between cancel and only the outer minus inner, which has the opposite direction, remains.

#lbl(<def:vector-fields-simply-connected-regions-1>, definition[
  A connected region $R$ is _simply connected_ iff for every closed curve $c$ in $R$, the interior of $c$ is also contained in $R$.
])

In other words, a region is simply connected if it has no holes. Thus, if a vector field is defined and differentiable on a simply connected region, then there will not be any issues akin to <emp:badHoles>.

#lbl(<thm:simConnectedConservative>, theorem[
  If the domain where $vb(F)$ is defined is simply connected and $op("curl") (vb(F)) = 0$, then $vb(F)$ is a gradient field, or conservative.
])
