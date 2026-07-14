
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Non-independent Variables",
  route: "dependent-var",
)
In the lagrange multipliers section, we discussed the min/max problem given one constraint of dependence of variables. Here, we consider more than the extrema, for example, partial derivatives.

In the same setup as lagrange multipliers, function a real, multi-variate function $f(x, y, z)$ constrained by $g(x, y, z) = c$.

With the constraint, $z$ could be represented as a function of $x$ and $y$, say $z(x, y)$. To understand how the variables relate to each other under this constraint, formally, we ask: what is $pdv(z, x)$ and $pdv(z, y)$?

Sometimes, it is possible to directly solve for $z$ in terms of $x$ and $y$; however, it is often inconvenient or impossible to do so.

Applying differential gives $ dif g = g_x dif x + g_y dif y + g_z dif z = 0. $

Thus, $ dif z = - g_x/g_z dif x - g_y/g_z dif y ==> cases(pdv(z, x) = - g_x/g_z, pdv(z, y) = - g_y/g_z). $

Here, we have an important potential confusion to clarify, which would be apparent in the following example.
#lbl(<ex:differentiation-non-independent-variables-1>, example[
  Let $f(x, y) := x+y, x = u and y = u + v$, find $pdv(f, x)$ and $pdv(f, u)$.

])
#solution[
  $pdv(f, x) = 1$, $f(u, v) = 2u + v ==> pdv(f, u) = 2$
]
#lbl(<rem:differentiation-non-independent-variables-1>, remark[
  From this example, we seem to have a contradiction that x = u but $pdv(f, x) != pdv(f, u)$. This is a result of different assumptions when we are taking each partial derivative. When doing $pdv(f, x)$, we assumed $dif y = 0$; when doing $pdv(f, u)$, we assumed $dif v = 0$. But fixing $y$ and fixing $v$ are different, that's why $pdv(f, x) != pdv(f, u)$. To avoid this kind of confusion, we must be explicit what we are keeping constant, and convention tells us to put it as a subscript, as $(pdv(f, x))_y$ represents the partial derivative of $f$ wrt $x$ *holding* $y$ as fixed.
])


To illustrate how to find the partial derivative while holding certain variable constant, we present the following example with two systematic methods.

#lbl(<ex:differentiation-non-independent-variables-2>, example[
  For a right triangle with one angle $theta$, hypotenuse $b$, adjacent leg $a$, and area $A$. Find $(pdv(A, theta))_a$.
])
#solution[
  (method 1: differential) The constraint is $a = b cos theta$. Since we hold $a$ as fixed, $ dif a = -sin theta b dif theta + cos theta dif b = 0 ==> dif b = b tan theta dif theta. $


  Thus, $A = 1/2 a b sin theta \ ==> dif A &= 1/2 (b sin theta dif a + a sin theta dif b + a b cos theta dif theta) \ &=1/2( 0 + a sin theta (b tan theta dif theta) + a b cos theta dif theta)
  \ &= 1/2 a b (sin^2 theta + cos^2 theta)/( cos theta) dif theta
  \ &= 1/2 a b sec theta dif theta$

  (method 2: chain rule) By chain rule, we have $ (pdv(A, theta))_a = A_theta (pdv(theta, theta))_a + A_a(pdv(a, theta))_a + A_b (pdv(b, theta))_a. $
  Notice here, $A_theta (pdv(theta, theta))_a = A_theta$ and $(pdv(a, theta))_a = a$, since we are fixing $a$. Lastly, $(pdv(b, theta))_a$ could be determined by the constraint given.

  In this case, since $b$ is solvable explicitly in terms of $a$ and $theta$, one could verify the result by direct substitution. However, generally, it cannot be assumed that there exist a convenient representation of variables in the constraint.
]
