#import "../../../lib.typ":*
== Green's Theorem 


To find the work along a closed curve, if the force field is not conservative, Green's Theorem is an alternative for direct computation. Rather than evaluating a line integral, Green's Theorem brings up the dimension by one and converts it to a double integral that is sometimes easier to evaluate. 

#theorem[
  Green's Theorem (in tangential form) states that, for a closed, counterclockwise curve $c$ that encloses a region $R$, fix a vector field $vb(F) = (M, N)$, then the work $ integral.cont_c vb(F) dot vb(r) = integral.double_R op("curl") (vb(F)) dif A = integral.double_R . $
  In other words, $ integral.cont_c M dif x + N dif y = integral.double_R N_x - M_y dif A. $
]<thm:green>
#remark[
  The fact that $c$ is taken as positive when it is counterclockwise comes from the convention that makes curl positive when it is counterclockwise. Or explicitly, that curl is defined as $N_x - M_y$, not the other way around. 
]
#proof[
  Observe that it suffices to show the case where $N =0$, or $ integral.cont_c M dif x = integral.double_R -M_y dif A $ as $vb(F) = (M, N) = (M, 0) + (0, N)$, and by symmetry if Green's Theorem holds for $x$, then it holds for $y$, thus any $N$. 

  The second key observation is that if $R = R_1 union R_2$ where $R_1 inter R_2 = emptyset$ and $c_1$ and $c_2$ are boundaries of $R_1$ and $R_2$, respectively, then $ integral.cont_c M dif x = integral.cont_c_1 M dif x + integral.cont_c_2 M dif x, $ and $ integral.double_R -M_y dif A = integral.double_R_1 - M_y dif A + integral.double_R_2 -M_y dif A. $

  Therefore, it suffices to show the case where the region is _simple_ with respect to $x$, meaning that it is enclosed by two lines perpendicular to the $x$-axis and two functions of x. 

  Let one of such regions be $R$, bounded by $c_s_1$ and $c_s_2$ that are line segments and $c_c_1$ and $c_c_2$ that are two functions of $x$. Since $c_s_1$ and $c_s_2$ are perpendicular to the $x$-axis, they both have $dif x = 0$, so $ integral.cont_c_c_1 = integral.cont_c_c_2 = 0. $

  Thus, $ integral.cont_c M dif x = integral.cont_c_c_1 M dif x + integral.cont_c_c_2 M dif x. $

  Let the function that corresponds to $c_c_1$ and $c_c_2$ be $y = f_1(x)$ and $y = f_2(x)$, then $ integral.cont_c M dif x &= integral.cont_c_c_1 M(x, f_1(x)) dif x + integral.cont_c_c_2 M(x, f_2(x)) dif x
  \ &= integral_a^b M (x, f_1(x)) dif x + integral_b^a (M(x, f_2(x)) dif x 
  \ &= integral_a^b M(x, f_1(x)) - M(x, f_2(x)) dif x . $

  However, $ integral.double_R - M_y dif A &= integral_a^b integral_(f_1(x))^(f_2(x)) - pdv(M, y) dif y dif x
  \ &= integral_a^b -(M(x, f_2(x)) - M(x, f_1)) dif x 
  \ &=integral_a^b M(x, f_1(x)) - M(x, f_2(x)) dif x \ &= integral.cont_c M dif x. $

  Thus, we are done. 
  ]
#example[
  Let $c$ denote the curve that is a unit circle centered at $(2, 0)$, counterclockwise. Compute $ integral.cont_c y e^(-x ) dif x + (1/2 x^2 - e^(-x))dif y. $
]

#solution[Without Green's Theorem, one may still compute this line integral with the following substitution of $ cases(x= 2 + cos theta , y = sin theta) ==> cases(dif x = - sin theta dif theta, dif y = cos theta dif theta). $ Then evaluate the integral from $theta = 0$ to $theta = 2 pi$. 

However, the Green's Theorem, we could maximally exploit the symmetry of the situation and evaluate a double integral instead. 

Let $ cases(M:=y e^(-x), N:=1/2 x^2 - e^(-x)), $ then $ N_x - M_y &= x + e^(-x) - e^(-x) = x. $

Let $R$ denote the given unit circle, then we can rewrite the given expression with Green's Theorem. 
$ integral.cont_c y e^(-x ) dif x + (1/2 x^2 - e^(-x))dif y &= integral.double_R N_x - M_y dif x dif y 
\ &= integral.double_R x dif x dif y 
\ &= op("area") (R) dot overline(x)
\ &= pi dot 2
\ & = 2 pi. $

Notice that we used the definition of the center of mass and exploited the symmetry of the configuration. 
]