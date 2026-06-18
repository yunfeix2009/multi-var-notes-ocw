#import "../../../lib.typ":*
== Lagrange Multipliers

Constraint optimization is a core theme in many sciences and maths. When dealing with continuous changes, differentiation is one of the most important ways of dealing with them; however, our current method of critical points and the second derivative test is not enough to model _constraints_. Thus, we present lagrange multipliers. 

Formally, lagrange multipliers method is a way of finding the extrema of a smooth, multi-variate function $f(x, y, z)$ where $x$, $y$, $z$ are dependent described by the constraint equation $g(x, y, z) = c$, where $c$ is a constant. 

Notice that since we are constrained to the part of $f$ along $g$, at local extrema, $f$ only increases/decreases along $g$. In terms of directional derivatives, $ forall vu(u): vu(u) "tangent to" g=c, dv(f, vu(s)) |_vu(u) = nabla f dot vu(u)=0. $

Thus, $nabla f perp vu(u)$. But $nabla g perp vu(u)$ since $vu(u)$ is tangent to the level surface of $g$ ($g = c$).   

Therefore, the key observation here is that at extremum, the level curve of $f$ is tangent to $g$. In other words, their normal vectors are parallel. Expressed in terms of gradient, $ nabla f = lambda nabla g, lambda in RR without 0. $ Upon solving this equation along with the constraint equation of $g = c$, extrema are obtained. 

#example[
  Find the point(s) on the hyperbola $x y = 1$ that is closest to the origin. 
]
#solution[
  Notice the quantity we are minimizing is the distance to the origin. For a certain point $(x_0, y_0)$, its distance to the origin is $sqrt(x_0^2 + y_0^2)$. Minimizing which is equivalent to minimizing $f(x, y) = x^2 + y^2$. Then, for our constraint equation, we let $g(x, y) := x y$, then $g(x, y) = 1$. 

  Thus, with this setup and $lambda in RR without 0$, we have the following equations: $ cases(nabla f = lambda nabla g, g= c) ==> cases(f_x = lambda g_x, g_y = lambda g_y, g(x, y) = c) ==> cases(2x = lambda y, 2y = lambda x, x y = 1). $

  Generally, a neat way to solve this set of equations is not guaranteed; however, for this specific problem, the equations are quite solvable. 

  Treating lambda as a constant, then the first two linear equations becomes a full system of linear equations of $x$ and $y$: $ mat(2, -lambda; lambda, -2) mat(x; y) = mat(0; 0). $

  Since the trivial solution of $(x, y) = (0, 0)$ does not satisfy the constraint equation, it must be $mat(2, -lambda; lambda, -2)$ to have determinant $0$. 

  Thus, $ mat(2, -lambda; lambda, -2; delim: "|") = -4 - (- lambda^2) = 0 ==> lambda = plus.minus 2.  $

  If $lambda = 2$, $ 2x = 2y ==> x = y ==> x^2 = 1 ==> x = y= plus.minus 1 ==> (x, y) in { (1, 1), (-1, -1)}. $

  If $lambda = -2$, $x = -y ==> -x^2 = 1$, no solutions in this cases. 

  Overall, the closest points are $(1, 1)$ and $(-1, -1)$, both with distance to the origin $1$. 
]

#remark[
  Literally, lagrange multiplier specifically refers to the "$lambda$," which "multiplies" according to Denis Auroux, lecturer of the $10.02$. Also, he interestingly noted that $lambda$ was likely selected to pay tribute to $l$agrange. 
]


However, there is one significant drawback of the method of lagrange multipliers. It is not apparent from the methods whether the found extremum is a minimum or maximum. Even worse, the second derivative test does not apply here as we are only concerned about a specific direction of $g = c$. 

Thus, one quite manual way to verify is to directly compare the value obtained by the method of lagrange multipliers and values on the neighborhood of the found point. 

Now we examine a relatively more involved example. 
#example[
  Fix a triangle on the x-y plane, find the minimum surface area with a given volume $V$ of a tetrahedron with the base as the given triangle. 
]

#solution[
  My first intuition was to model the situation entirely with vectors: $v_1, v_2, v_3$ for the given triangle and $v_4$ for the moving apex. Then noticed that the height is fixed. I modeled with the targeting surface areas with magnitude of cross products. In order to simplify the surface area function $f$, I used the lagrange identity for vectors (see @thm:lagrange-identity). Since $ vb(v_4) dot nabla f = dv(f, vb(v_4)), nabla f = dv(f, vb(v_4))/vb(v_4). $ However, it is here that I looked at the first part of the solution and realized that I took on a circuitous route. 

  The key insight is that, in stead of cross product, represent the area of the side triangles with base and slanted height. Let the area of the base triangle be $A$, lengths of three sides be $a, b, c$, and the length of the altitude to $a, b, c$ from the projection of the apex onto the x-y plane be $alpha, beta, gamma$, respectively. 

  The constraint equation $ g(alpha, beta, gamma) := 1/2 (a alpha + b beta + c gamma) = A \ ==> nabla g = 1/2 (a, b, c). $ 

  Let $f(alpha, beta, gamma)$ denote the sum of the area of the side triangles. Then, we have $ & f(alpha, beta, gamma) = 1/2(a sqrt(h^2 + alpha^2) + b sqrt( h^2 + beta^2 ) + c sqrt(h^2 + gamma^2)) \ & ==> nabla f = ((a alpha)/(2 sqrt(h^2 + a^2)), (b beta) /(2 sqrt(h^2 + beta^2 )), (c gamma)/(2 sqrt(h^2 + gamma^2))) 
  \ &. $

  For $lambda in RR without 0$, $ nabla f = lambda nabla g ==> cases(a/2 = (a alpha)/(2 sqrt(h^2 + alpha^2)), b/2 = (b beta)/(2 sqrt(h^2 + beta^2)), c/2 = (c gamma)/(2 sqrt(h^2 + gamma^2)))  = cases(alpha = (h lambda)/sqrt(1-lambda^2), beta = = (h lambda)/sqrt(1-lambda^2), gamma = = (h lambda)/sqrt(1-lambda^2)) ==> alpha = beta = gamma. $

  Surprisingly (or maybe not), the projection of the apex to the x-y plane is the given triangle's incenter!

  With this fact, the computation to obtain an explicit formula becomes pedantic. Ultimately, $f >= 1/2 sqrt( 4A^2 + (a+b+c)^2h^2)  = A + √(A^2 + ((3V P)/(2A))^2)$ 
]
