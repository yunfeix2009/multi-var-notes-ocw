#import "../../../lib.typ":*
== Double Integrals

In one variable calculus, the integral of a function is the area under its curve in a certain interval. Naturally, in calculus for functions of two variables, _double integral_ measure the volume under its surface under a certain region. 

#definition[
  For a region $R$, $A_i$ are disjoint subsets of $R$ such that $union.big_i A_i = R$. Then, for a two variable function $f(x, y)$, the volume under the surface of $f(x, y)$ over the region $R$ approximates to $sum_(i) f(x, y) A_i$. 

  Define $ integral.double_R f(x, y) dif A = lim_(A_i -> 0) sum_(i) f(x, y) A_i. $
]

As a way to compute double integrals without doing the summation, we consider the volume as sum of the slices along the y-z plane. In fact, $ integral.double_R f(x, y) dif A &= integral_(x_"min")^(x_"max") [integral_(y_"min" (x))^(y_"max"(x)) f(x, y) dif y] dif x
\ & = integral_(y_"min")^(y_"max") [integral_(x_"min" (y))^(x_"max"(y)) f(x, y) dif x] dif y $

#example[
  Let $ z=1-x^2 - y^2, R:={(x, y): 1<=x, y<=1}. $ Compute $ integral.double_R z dif x dif y. $
]<emp:3.1.2>
#solution[
  By iterating, $ integral.double_R z dif x dif y &= integral_0^1 (integral_0^1 (1-x^2 - y^2) dif y) dif x
  \ &= integral_0^1 (1 - x^2 - 1^3/3) dif x
  \ &= (1 - 1^3/3 -1^3/3)
  \ &= 1/3. $

  Here, $dif A = dif x dif y$
]
#remark[
  In here, it does not matter whether we integrate $x$ first or $y$ first, due to complete symmetry between $x$ and $y$. In practice, often it is more complicated to integrate one way versus another. 
]

The following example illustrates the case where the bound of $y$ does depend on the value of $x$. 
#example[
  Let $ z = 1-x^2 - y^2, R:= {(x, y) in RR^+^2 : x^2 + y^2 <=1}. $ Compute $ integral.double_R z dif x dif y. $
]
#solution[
  At $x = x_0$, the bound for y is $[0, sqrt(1-x_0^2)]$, thus $ integral.double_R z dif x dif y &= integral_0^1 (integral_0^(sqrt(1- x^2)) (1-x^2 -y^2) dif y) dif x
  \ &= integral_0^1 (sqrt(1-x^2) - sqrt(1-x^2) x^2 - (sqrt(1-x^2)^(3/2))/3) dif x 
  \ &= 2/3 integral_0^1 sqrt(1-x^2)^(3/2) dif x.
  $
  Now, this double integral is reduced entirely to a single variable integration, which we may solve in traditional means. Let $x := sin theta$. $x in [0, 1] ==> theta in [0, pi/2]$. 
  Therefore, $ 
  2/3 integral_0^(1) sqrt(1-x^2)^(3/2) &= 2/3 integral_0^(pi/2) cos theta^3 cos theta dif theta
  \ &= 2/3 integral_0^(pi/2) ((cos (2 theta) + 1)/2)^2 dif theta
  \ &= 2/3 integral_0^(pi/2) ((cos (4 theta))/8 + cos (2 theta) + 3/8) dif theta
  \ &= 0 + 0 + 2/3 3/8 pi/2
  \ &= pi/8.
   $
]

#remark[
  This computation would be much easier with the use of polar coordinates, covered in the next section. 
]

Changing the order of integration is a crucial technique in solving double integrals. Consider the following example. 
#example[
  Compute $ integral_0^1 integral_x^sqrt(x) e^y/y dif y dif x. $
]
#solution[
  Notice that there is no easy way to integrate $integral_x^sqrt(x) e^y / y dif y$. However, we could swap the bounds, $ integral_0^1 integral_x^sqrt(x) e^y/y dif y dif x &= integral_0^1 integral_(y^2)^y e^y/y dif x dif y
  \ &= integral_0^1 (e^y - y e^y) dif y
  \ & = lr((2 e^y - y e^y)) |_0^1
  \ &= e-2. $
]
#remark[
  $pi$!
  Or, if you prefer, $1434$. 
]