
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Directional Derivative ",
  route: "directional-derivative",
)
In gradient and partial derivatives, we considered the change of the function along the direction of $x$, $y$, $z$, etc. Now, we consider the change in the function along a customized, non-coordinate direction.

In other words, fix a real function $z = w(x, y)$, and a two dimensional vector in the x-y plane $vu(u)$, which is parameterized by $s$. $dv(vb(r), s) = vu(u)$, what is $dv(w, s))$

#lbl(<def:differentiation-directional-derivative-1>, definition[
  The directional derivative of the function $w$ wrt arc-length $s$ in the direction of $vu(u)$ is $ dv(w, s) |_vu(u). $
])

In other words, $dv(w, s) |_vu(u)$ is the slope of the slice of graph by a vertical plane parallel to $vu(u)$.

With chain rule, $ dv(w, s) |_vu(u) = nabla w dot vu(u). $

As a quick sanity check, $ dv(w, s) |_vu(i) = nabla w dot vu(i) = pdv(w, x). $

Furthermore, $ nabla w dot vu(u) = abs(nabla w) cos theta. $ Since $cos theta <=1$, this implies the increment of the function is maximized along the direction of the gradient, minimized in the opposite direction as the gradient. Also, $vu(u) perp nabla w <==> vu(u)$ is tangent to level.
