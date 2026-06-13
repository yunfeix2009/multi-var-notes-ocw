#import "../../../lib.typ":*
== Line Integrals 

We motivate the concept of line integrals with a physical concept: work. 

#definition[
  Work, $w$ is defined as the dot product of the force vector, $vb(F)$ and the displacement vector, $vb(r)$. Formally, $ W = vb(F) dot vb(r). $
]

However, $vb(F)$ and $vb(r)$ may vary, as the target is moving along a trajectory. Thus, to find work, one must split the trajectory to small pieces to be approximated as constant $vb(F)$ and $vb(r)$, then integrate the $dif W$ along the trajectory.

In general, $ W = integral_(t_1)^(t_2) vb(F) dot dv(vb(r), t) dif t. $

#example[
  Fix the force field $ vb(F) = - y vu(i) + x vu(j) $ and trajectory $ c := cases(x = t, t = t^2), t in [0, 1]. $ Find the word done by the force field. 
]<emp:work1>
#solution[
  Let $ vb(r):= x vu(i) + y vu(j)$, $ dv(vb(r), t) = vu(i) + 2 t vu(j). $ 
  Therefore, $ W &= integral_c vb(F) dot vb(r) dif s \ &= integral_(t_1)^(t_2) vb(F) dot dv(vb(r), t) dif t
  \ &=integral_0^1 (-y vu(i) + x vu(j)) dot (vu(i) + 2 t vu(j)) dif t 
  \ &= integral_0^1 (-y + 2 x t) dif t
  \ &= integral_0^1 t^2 dif t 
  \ &= 1/3. #qedhere $
]
However, alternatively, one may also notice that if $vb(F) = (M, N)$ and $vb(r) = (dif x, dif y)$, then $ integral_c vb(F) dot vb(r) = integral_c M dif x + N dif y. $
There is a catch, though, that $M$ and $N$ are dependent on both $x$ and $y$. But the trajectory serves as a constraint, making the right side two single variable integrals. Hence, another solution to @emp:work1 is as follows. 
#solution[
  $ W &= integral_c vb(F) dot vb(r) 
  \ &= integral_c M dif x + N dif y
  \ &= integral_c -y dif x + x dif y
  \ &= integral_c -t^2 dif t + 2 t^2 dif t 
  \ &= integral_0^1 t^2 dif t
  \ &= 1/3. #qedhere $
]

#remark[
  Work, $integral_c vb(F) dot vb(r)$ is generally dependent on the trajectory but the not parametrization, so in practice, one should use the most convenient parametrization. 
]

Often, it is useful to think about the geometric relationship between $vb(F)$ and $vb(r)$. For example, the lorenz force always do $0$ work as it is always perpendicular to the trajectory. 