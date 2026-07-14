
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Line Integrals ",
  route: "line-int",
)
We motivate the concept of line integrals with a physical concept: work.

#lbl(<def:integration-line-integrals-1>, definition[
  Work, $w$ is defined as the dot product of the force vector, $vb(F)$ and the displacement vector, $vb(r)$. Formally, $ W = vb(F) dot vb(r). $
])

However, $vb(F)$ and $vb(r)$ may vary, as the target is moving along a trajectory. Thus, to find work, one must split the trajectory to small pieces to be approximated as constant $vb(F)$ and $vb(r)$, then integrate the $dif W$ along the trajectory.

In general, $ W = integral_(t_1)^(t_2) vb(F) dot dv(vb(r), t) dif t. $

#lbl(<emp:work1>, example[
  Fix the force field $ vb(F) = - y vu(i) + x vu(j) $ and trajectory $ c := cases(x = t, t = t^2), quad t in [0, 1]. $ Find the word done by the force field.
])
#solution[
  Let $vb(r):= x vu(i) + y vu(j)$, $ dv(vb(r), t) = vu(i) + 2 t vu(j). $
  Therefore, $ W & = integral_c vb(F) dot vb(r) dif s \
    & = integral_(t_1)^(t_2) vb(F) dot dv(vb(r), t) dif t \
    & =integral_0^1 (-y vu(i) + x vu(j)) dot (vu(i) + 2 t vu(j)) dif t \
    & = integral_0^1 (-y + 2 x t) dif t \
    & = integral_0^1 t^2 dif t \
    & = 1/3. #qedhere $
]
However, alternatively, one may also notice that if $vb(F) = (M, N)$ and $vb(r) = (dif x, dif y)$, then $ integral_c vb(F) dot dif vb(r) = integral_c M dif x + N dif y. $
There is a catch, though, that $M$ and $N$ are dependent on both $x$ and $y$. But the trajectory serves as a constraint, making the right side two single variable integrals. Hence, another solution to @emp:work1 is as follows.
#solution[
  $
    W & = integral_c vb(F) dot dif vb(r) \
      & = integral_c M dif x + N dif y \
      & = integral_c -y dif x + x dif y \
      & = integral_c -t^2 dif t + 2 t^2 dif t \
      & = integral_0^1 t^2 dif t \
      & = 1/3. #qedhere
  $
]

#lbl(<rem:integration-line-integrals-1>, remark[
  Work, $integral_c vb(F) dot dif vb(r)$ is generally dependent on the trajectory but the not parametrization, so in practice, one should use the most convenient parametrization.
])

Often, it is useful to think about the geometric relationship between $vb(F)$ and $vb(r)$. For example, the lorenz force always do $0$ work as it is always perpendicular to the trajectory.

=== Line Integrals in Space
Now, we generalize line integrals from $RR^2$ to $RR^3$.

For a vector field $vb(F) = P vu(i) + vu(j) + vu(k)$ and a curve $c$, work is $ integral_c bold(F) dot dif vb(r), $ where $r = x vu(i) + y vu(j) + z vu(z)$.

Like in $RR^2$, if we can parametrize $c$, the line integral could be evaluated rather directly.

#lbl(<ex:integration-line-integrals-2>, example[
  Fix curve $c$ to be moving from $(0, 0, 0)$ to $(1, 0, 0)$ to $(1, 1, 0)$ to $(1, 1, 1)$ and $vb(F) = y z dif x + x z dif y + x y dif z$. Compute the work done by $vb(F)$ for a point moving along $c$.
])
#solution[
  Split $c$ naturally to $c_1$, $c_2$, and $c_3$, then $ integral_c = integral_c_1 + integral_c_2 + integral_c_3. $

  Notice that along $c_1$ and $c_2$, $z = 0$ and $dif z = 0$. Thus, $ integral_c_1 vb(F) dot dif vb(r) = integral_c_2 vb(F) dot dif vb(r) = 0. $
  For $c_3$, $ integral_c_3 vb(F) dot dif vb(r) = integral x y dif z = integral_0^1 dif z = 1. $
]

#lbl(<rem:integration-line-integrals-2>, remark[
  In fact, $vb(F)$ is conservative---it is the gradient field of $f = x y z$. So, work is $f(1, 1, 1) - f(0, 0, 0) = 1$.
])

In general, to test whether a vector field in $RR^3$ is a gradient field, we have the follow criterion. Fix $vb(F)$ (defined and differentiable on its domain ), it has potential function $f$ iff $vb(F) = (P, Q, R) = (f_x, f_y, f_z)$. This is true only if $ cases(P_y = f_(x y) = f_(y x)= Q_x, Q_z = f_(y z) = f_(z y) = R_y, Q_x = f_(z x) = f_(x z) = P_z). $

#lbl(<ex:integration-line-integrals-3>, example[
  (Practice final P13)  Evaluate $integral_C (y - x) dif x + (y - z) dif z$ over the line segment $C$ from $P : (1, 1, 1)$ to $Q : (2, 4, 8)$.
])
#solution[
  Parametrize $C$ as $ cases(x(t) = 1 + t, y(t) = 1 + 3 t, z(t) = 1+7t). $
  $
    integral_C (y - x) dif x + (y - z) dif z & = integral_0^1 2t dif t -4t (7 dif t) \
                                             & = integral_0^1 -26 t dif t \
                                             & = -13. #qedhere
  $
]

#lbl(<def:curl3D>, definition[
  A differential $P dif x + Q dif y + R dif z$ is _exact_ iff there exists a function $f$ such that $ dif f =P dif x + Q dif y + R dif z. $
])
Notice that a vector field $vb(F) (P, Q, R)$ is conservative iff $P dif x + Q dif y+ R dif z$ is _exact_.

Given a conservative vector field $vb(F) (x, y, z)$, to find its potential $f$, one could compute three line integrals along $x$-axis, $y$-axis, and $z$-axis.


Alternatively, one could try to find the antiderivative wrt $x$ first, up to the integration constant, which is a function of $y$ and $z$, then integrate wrt $y$, then $z$, finally reducing the integration constant to, well, a constant.
