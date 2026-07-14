
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Gradient",
  route: "grad",
)

#lbl(<def:differentiation-gradient-1>, definition[
  Fix a three variable real function $f(x, y, z) = w$, define $ nabla f = (f_x, f_y, f_z). $
])
Observe that now we could write $ dv(f, t) = nabla f dot dv(vb(r), t). $

#lbl(<thm:normal-vector-gradient>, theorem[
  Let $w = f(x, y, z)$, then $nabla w (x_0, y_0, z_0) perp$ the level surface $cal(S)$ at $(x_0, y_0, z_0)$, described by $f(x, y, z) = f(x_0, y_0, z_0)$, denoted as $cal(S)$.
])
#proof[
  Consider a curve described by $vb(r) = vb(r)(t) in cal(S)$. By chain rule, $ dv(w, t) = nabla w dot dv(vb(r), t) = 0. $ Thus, $nabla w perp dv(vb(r), t)$. However, $dv(vb(r), t)$ is tangent to the curve therefore tangent to $cal(S)$. Since $vb(r) = vb(r)(t)$ is arbitrary, $nabla w$ is tangent to all tangent vectors of $cal(S)$ at $(x_0, y_0, z_0)$, thus tangent to $cal(S)$ at $(x_0, y_0, z_0)$.
]



#lbl(<ex:differentiation-gradient-1>, example[
  Find the tangent plane to $x^2 + y^2 - z^2 = 4$ at $(2, 1, 1)$.
])
#solution[
  The normal to the plane is $nabla w$ where $w = f(x, y, z)$. $ nabla w & = (f_x, f_y, f_z) & = (2x, 2y, -2z) = (4, 2, -2). $ Thus, the plane is $ 4x + 2y - 2z = 4 dot 2 + 2 dot 1 - 2 dot 1 = 8. $
]

We continue our discussion with gradient with directional derivatives.
