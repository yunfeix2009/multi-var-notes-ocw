
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Geometric Interpretation",
  route: "geometric-lens",
)

For a one variable function, its derivative at a certain point is the slope of the tangent line at that point. In other words, its tangent line at a point could be determined by its derivative at that point.

For a function of two variables, $f(x, y)$, one may similarly define the tangent plane at a certain point $(x_0, y_0, f(x_0, y_0))$. Slice the solid formed by $f(x, y)$ at the point parallel to the x-z plane and y-z plane gives two graphs. With the one variable methods, two tangent lines could be obtained, with slope of $pdv(f, x)$ and $pdv(f, y)$. Since the tangent plane contains these two lines, the plane's normal could be obtained by crossing the direction of the two lines.
#lbl(<ex:differentiation-geometric-lens-1>, example[
  Assume that $f(x, y)$ is a function of two variables with $pdv(, x) (x_0, y_0) = a$ and $pdv(, y) (x_0, y_0) = b$. Find the plane tangent to $f(x, y)$ at $(x_0, y_0, f(x_0, y_0))$.
])
#solution[
  The line tangent to $f(x_0, y_0)$ that lies in the plane through $(x_0, y_0, f(x_0, y_0))$ parallel to the x-z plane is $ L_1 = cases(z = z_0 + a (x - x_0), y=y_0), $ where $z_0 := f(x_0, y_0)$.

  Similarly, the line tangent to $f(x_0, y_0)$ that lies in the plane through $(x_0, y_0, f(x_0, y_0))$ parallel to the y-z plane is $ L_2 = cases(z = z_0 + b (y - y_0), x=x_0). $

  Thus, the tangent plane could be obtained with cross product: $ z = z_0 + a(x-x_0) + b(y-y_0). #qedhere $
]

#lbl(<thm:normal-vector-cross>, theorem[
  The normal vector wrt a surface that is defined by $vb(r) (u, v)$ is $pdv(vb(r), u) times pdv(vb(r), v)$, where $vb(r)$ is a 3D vector.
])

#proof[
  Notice that $pdv(vb(r), v)$ and $pdv(vb(r), u)$ are both tangent to surface. Thus, their cross product is normal to the surface.
]
