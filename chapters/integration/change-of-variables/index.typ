#import "../../../lib.typ":*
== Change of Variables 

Change of variables is a useful integration technique. 

#example[
  Compute the area of an ellipse. 
]
#solution[
  With double integrals, we have $ integral.double dif x dif y, $
  where $ (x/a)^2 + (y/b)^2 <= 1. $

  This is doable with changing bounds directly; however, that is certainly but the best way to do it. If we were to find the area of a circle, we would use polar coordinates, but in here it's not convenient to do so. Geometrically, we would scale the ellipse into a circle. 

  Thus, we are motivated to reduce the problem down to the circle case, through change of variables.

  Let $ cases(u:=x/a, v :=y/b) ==> cases(dif u = 1/a dif x, dif v = 1/b dif y) ==> dif x dif y = a b dif u dif v. $
  Hence, $ integral.double dif x dif y = integral.double_(u^2 + v^2 <= 1) a b dif u dif v = a b integral.double_(u^2 + v^2 <=1) dif u dif v = a b pi.  $
]
#remark[
  From here, we can see that in general, we need to find $dif x dif y$ in terms of $dif u dif v$. 
]

In general, $ cases(dif u = u_x dif x + u_y dif y , dif v = v_x dif x + v_y dif y) ==> mat(dif u; dif v) = mat(u_x, u_y; v_x, v_y) mat(dif x; dif y). $

Since linear transformations preserve collinearity, a $dif x $ by $dif y$ rectangle is mapped to a parallelogram, with area $ dif u times dif v &= ( u_x dif x + u_y dif y ) times (v_x dif x + v_y dif y) \ &= (u_x v_y - v_x u_y) dif x times dif y 
\ &=  mat(u_x, u_y; v_x, v_y; delim:"|") dif x times dif y. $  

#definition[
  For differentials forms, like exterior product ( $and$ wedge) be an anti-commutative ($a and b = - b and a$) and associative product between differentials that measures the oriented area in the x-y plane. 
]


Then, we have $ dif u and dif v =  mat(u_x, u_y; v_x, v_y; delim:"|") dif x and dif y ==> dif A' = mat(u_x, u_y; v_x, v_y; delim:"|") dif A. $

#definition[
  Define _jacobian_ of $u$ and $v$ wrt $x$ and $y$ to be $ bold(J) := (partial(u, v))/(partial (x, y)) = mat(u_x, u_y; v_x, v_y; delim:"|"). $
]

Then, we have $dif u dif v = abs(bold(J)) dif x dif y. $
In fact, the jacobian is easily generalizable to finitely many variables. In the special case that there is only one variable, this substitution becomes the well-known "u-substitution."

#example[
  Find the jacobian of $x$ and $y$ wrt $r$ and $theta$. 
]
#solution[
  By definition, $ bold(J) &= (partial (x, y))/(partial (r, theta)) \ &= mat(x_r, x_theta; y_r, y_theta; delim:"|") \ &=mat(cos theta, - r sin theta; sin theta, r cos theta; delim:"|") \ &= r cos^2 theta + r sin^2 theta \ &= r. $

  Furthermore, $ dif x dif y = r dif r dif theta, $ supporting the previous geometric argument. 
]
#remark[
  Since the formula must be consistent, $ (partial (u, v))/(partial (x, y)) dot (partial (x, y))/(partial (u, v)) = 1. $
]

Here, we will work out another example purely for practice. 

#example[
  Compute $ integral_0^1 integral_0^1 x^2 y dif x dif y, $ with the change of variables of $ cases(u= x, v = x y). $
]

#solution[
  We first compute the jacobian: $ bold(J) &= mat(u_x, u_y; v_x, v_y; delim:"|") \ &=  mat( 1, 0; y, x; delim:"|") \ &= x. $

Notice that here, everything is positve, so we do not have to concern about the sign of $bold(J)$. 

  Thus, $ integral_0^1 integral_0^1 x^2 y dif x dif y &= integral_0^1 integral_0^1 (u v)/ x dif u dif v
  \ &= integral_0^1 integral_0^1 v dif u dif v 
  \ &= integral_0^1 v dif v
  \ &= 1/2.
  $

  $dots$ but this is wrong as one may verify with direct computation. The issue here is change of variables without change of bounds. Therefore, we aim to find the bounds of integration in $ integral integral v dif u dif v. $
  In the inner integral, $v$ is fixed, so $u$ moves in a hyperbola on the x-y plane. Since the lower bound is a $y=1$, so the lower bound in terms of $v$ is just $u_min (v) = v$. The upper bound is where $x = 1$, so $u_max (v) = 1$. On the other hand, $v$ goes from $0$ to $1$. 

  Thus, $ integral_0^1 integral_0^1 x^2 y dif x dif y &= integral_0^1 integral_v^1 v dif u dif v 
  \ &= integral_0^1 (1-v)v dif v 
  \ &= lr((v^2/2 - v^3/3) |)_0^1
  \ &=1/2 - 1/3
  \ &= 1/6. $
]
