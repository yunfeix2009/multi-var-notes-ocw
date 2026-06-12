#import "../../../lib.typ": *
== Gradient

#definition[
  Fix a three variable real function $f(x, y, z) = w$, define $ nabla_f = (f_x, f_y, f_z). $
]
Observe that now we could write $ dv(f, t) = nabla_f dot dv(vb(r), t). $

#theorem[
  Let $w = f(x, y, z)$, then $nabla_w (x_0, y_0, z_0) perp$ the level surface $cal(S)$ at $(x_0, y_0, z_0)$ ($cal(S) = f(x, y, z) = f(x_0, y_0, z_0)$). 
]
#proof[
  Consider a curve described by $vb(r) = vb(t)(t) in cal(S)$. By chain rule, $ dv(w, t) = nabla_w dot dv(vb(r), t) = 0. $ Thus, $nabla_w perp dv(vb(r), t)$. However, $dv(vb(r), t) $ is tangent to the curve therefore tangent to $cal(S)$. Since $vb(r) = vb(r)(t)$ is arbitrary, $nabla_w$ is tangent to all tangent vectors of $cal(S)$ at $(x_0, y_0, z_0)$, thus tangent to $cal(S)$ at $(x_0, y_0, z_0)$. 
]<thm:normal-vector-gradient>


#theorem[
  The normal vector at a point $(u_0, v_0)$ wrt a surface that is defined by $vb(r) (u, v)$ is $nabla F(u) times nabla F(v)$, where $vb(r)$ is a 3D vector.
]<thm:normal-vector-cross>

#example[
  Find the tangent plane to $x^2 + y^2 - z^2 = 4$ at $(2, 1, 1)$. 
]
#solution[
  The normal to the plane is $nabla_w$ where $w = f(x, y, z)$. $ nabla_w &= (f_x, f_y, f_z)  &= (2x, 2y, -2z) = (4, 2, -2). $ Thus, the plane is $ 4x + 2y - 2z = 4 dot 2 + 2 dot 1 - 2 dot 1 = 8.  $ 
]