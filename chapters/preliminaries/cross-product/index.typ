#import "/lib.typ": *

== Cross Product
With @def:dot-product, we have the means to often conveniently express angles and lengths in terms of vectors. However, there is another important concept that we are unable to grapple with using dot product. And that is area. For which we seek help from the use of @def:cross-product.

#theorem[
  The area of the triangle formed by two vectors with the same dimensions, $vb(a)$ and $vb(b)$ is $ mat( delim:"|",a_1, a_2; b_1, b_2)$
]
#proof[
  Let $theta$ denote the angle between $vb(a)$ and $vb(b)$. Then geometrically, we have the area to be $ 1/2 norm(vb(a)) norm(vb(b)) sin theta. $
  Therefore, we aim to find $sin theta$ in terms of $vb(a)$ and $vb(b)$.

  Let $vb(a')$ be the image of rotation of $vb(a)$  for $pi/2$ in the direction towards $vb(b)$. Let $theta'$ denote the angle between $vb(a)$ and $vb(b)$.

  We have $ norm(vb(a)) norm(vb(b)) sin theta = norm(vb(a')) norm(vb(b)) cos(theta') = vb(a') dot vb(b). $

  Let $vb(a)$ have components $(a_1, a_2)$, then $vb(a')$ have components $(-a_2, a_1)$. Thus, the area is $ 1/2 vb(a') dot vb(b) = 1/2(-a_2 b_1 + a_1 b_2) = 1/2 det mat(a_1, a_2; b_1, b_2). $
]

#remark[
  However, in this way, the area is not necessarily positive. Thus, we adopt the convention of signed area: the area formed by $vb(a)$ rotating counterclockwise to $vb(b)$ is positive by convention.
]

By the determinant definitions from the matrices section, the three-dimensional determinant gives the signed volume of the parallelepiped formed by $vb(a), vb(b),$ and $vb(c)$.

Now, we are ready to define cross product.
#definition[
  For two given three dimensional vectors $vb(a)$ and $vb(b)$ with components $(a_1, a_2, a_3)$ and $(b_1, b_2, b_3)$, respectively. We define the cross product between $vb(a)$ and $vb(b)$, $vb(a) times vb(b)$, as the vector $ det mat(hat(bold(i)), hat(bold(j)), hat(bold(k)); a_1, a_2, a_3; b_1, b_2, b_3). $ <def:cross-product>
]

#theorem[
  For two given three dimensional vectors $vb(a)$ and $vb(b)$, $norm(vb(a) times vb(b))$ is equal to the (signed) area of the parallelogram formed by $vb(a)$ and $vb(b)$. And the direction of $vb(a) times vb(b)$ is orthogonal to the plane formed by $vb(a)$ and $vb(b)$, while satisfying the right hand rule.
]
#proof[
  This result comes directly from the definition of the cross product.
]

#theorem[
  For three 3D vectors $vb(a), vb(b),$ and $vb(c)$, $ det (vb(a), vb(b), vb(c)) &= vb(a) dot (vb(b) times vb(c)) \ &=vb(b) dot (vb(c) vb(a)) \ & = vb(c) dot (vb(a) times vb(b)). $
]
#proof[
  This result comes directly from the expansion of both sides. However, an argument based on the geometric meaning in terms of the area of the parallelepiped could also be established.
]
#theorem[Lagrange Identity (two variables)][
  $ norm(vb(a) times vb(b))^2 = norm(vb(a))^2 norm(vb(b))^2 - (vb(a) dot vb(b))^2 $
]<thm:lagrange-identity>
#proof[
  Although direct expansion with the component form does verify this identity, we hereby proceed with a more geometric argument. 

  Let $theta$ be the angle between $vb(a)$ and $vb(b)$, we have 
  $ norm(vb(a) times vb(b))^2 &= norm(abs(vb(a)) norm(vb(b)) sin theta) \ &= (norm(vb(a))^2 norm(vb(b))^2 dot sin^2 theta \ &=  (norm(vb(a))^2 norm(vb(b))^2 dot (1- cos^2 theta)\ &=norm(vb(a))^2 norm(vb(b))^2 - (vb(a) dot vb(b))^2. $
]
#remark[
  In fact, this theorem is generalizable to finitely many vectors. 
]


#example[Pset2 PartII P1][
  Suppose we know that when the three planes $P_1$, $P_2$, and $P_3$ in $RR^3$ intersect in pairs, we get three lines $L_1$, $L_2$, and $L_3$ which are _distinct_ and _parallel_.

  a) Sketch a picture of this situation.

  b) Show that the three normals to $P_1$, $P_2$, and $P_3$ all lie in one plane, using a geometric argument.

  c) Show that the three normals to $P_1$, $P_2$, and $P_3$ all lie in one plane, using an algebraic argument. (Note that the three planes clearly do _not_ all intersect at one point.)
]
#solution[
  (a) Graph omitted, the intersection of the three planes form a triangular prism. 
  (c) Let the normals of the three planes be $vb(n_1), vb(n_2)$, and $vb(n_3)$, respectively. The pairwise intersections of the three planes have direction given by $ vb(n_1) times vb(n_2), vb(n_2) times vb(n_3)$, and $vb(n_3) times vb(n_1). $ The three lines are parallel gives all of these quantities are equal. $ vb(n_1) times vb(n_2) = vb(n_2) times vb(n_3) ==> - vb(n_2) times vb(n_1) = vb(n_2) times vb(n_3) ==> -vb(n_1) tilde vb(n_3) ==> vb(n_1) tilde vb(n_3). $ Similarly, $vb(n_2) tilde vb(n_1)$, so all three normals are coplanar. 
]

#example[Pset2 PartII P3][
  For any plane $P$ which is not parallel to the $x$-$y$ plane, define the _steepest direction_ on $P$ to be the direction of any vector which lies in $P$ and which makes the largest (acute) angle with the $x$-$y$ plane.

  a) Let $P$ be the plane through the origin with normal vector $n$. Derive a formula, in terms of $n$, for a vector $w$ which points in the steepest direction on $P$.

  b) Now let $P$ be the plane through the origin which contains two non-parallel vectors $u$ and $v$, where $u$ and $v$ do not both lie in the $x$-$y$ plane. Derive a formula, in terms of $u$ and $v$, for a vector $w$ which points in the steepest direction on $P$.
]
#solution[
  (a) We may draw some insights from previous sections. From @ex:dot-product-angle-2, we have that $cal(P)$ is described by $ mat(a, b, c) dot hat(bold(n)) = 0. $ Also, the desired direction is represented by $nabla F$, where $F(x, y, z) = 0$ describes the surface.

  However, to fully solve the problem with cross product, we consider the two planes in play: $cal(P)$ and the x-y plane. The desired vector, $vb(v)$ satisfies the constraint of $vb(v) dot hat(vb(n)) = 0$ and optimizes for the greatest value of $vb(v) dot (hat(vb(i)) times hat(vb(j)))$.

  Let the normal vector of the x-y plane be $vb(k)$, then  $vb(v) = (vb(n) times vb(k)) times vb(n)$

  (b) Notice that the $hat(vb(n)) tilde vb(u) times vb(v)$, so we can directly apply the result from part (a) that $ vb(v) = ((vb(u) times vb(v)) times vb(k)) times (vb(u) times vb(v)). $
]


#example[
  Fix three 3D dimensional vectors $vb(a), vb(b), vb(c)$. Determine whether another vector $vb(v)$ is on the plane formed by $vb(a), vb(b),$ and $vb(c)$. 
]

#solution[
  The vector $vb(v)$ is on the plane iff $ vb(v) dot ((vb(a) - vb(b)) times (vb(a) - vb(c))) = 0. $
  Symmetrically, it could be expressed as $ det mat(vb(p) - vb(a), vb(p) - vb(b), vb(p)- vb(c)) = 0. $
]
