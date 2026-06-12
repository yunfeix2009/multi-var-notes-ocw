#import "/lib.typ": *

== Matrices

One of the motivations to have matrices is when transforming coordinate systems. 
$
cases(
  u_1 = 2x_1 + 3x_2 + 3x_3,
  u_2 = 2x_1 + 4x_2 + 5x_3,
  u_3 = x_1 + x_2 + 2x_3,
)
$

which can be written as

$
mat(
  2, 3, 3;
  2, 4, 5;
  1, 1, 2
)
mat(
  x_1;
  x_2;
  x_3
)
=
mat(
  u_1;
  u_2;
  u_3
)
$

#definition[
Let $bold(A) = (a_(i j))$ be an $m times n$ matrix and
$bold(B) = (b_(i j))$ be an $n times p$ matrix.

The *matrix product* $bold(A) bold(B)$ is the $m times p$ matrix whose
$(i,j)$-entry is

$
(bold(A) bold(B))_(i j) = sum_(k=1)^n a_(i k)b_(k j).
$

Equivalently, the $(i,j)$-entry of $bold(A) bold(B)$ is obtained by taking
the dot product of the $i$th row of $bold(A)$ with the $j$th column
of $bold(B)$.

The product $bold(A) bold(B)$ is defined only when the number of columns of
$bold(A)$ equals the number of rows of $bold(B)$.
]

#definition[
  For a $2 times 2$ matrix
  $
  bold(A) = mat(
    a, b;
    c, d
  ),
  $
  its *determinant* is defined by
  $
  det bold(A) = a d - b c.
  $
]

#definition[
  For a $3 times 3$ matrix
  $
  bold(A) = mat(
    a_1, a_2, a_3;
    b_1, b_2, b_3;
    c_1, c_2, c_3
  ),
  $
  its *determinant* is defined by
  $
  det bold(A)
  =
  a_1 det mat(
    b_2, b_3;
    c_2, c_3
  )
  - a_2 det mat(
    b_1, b_3;
    c_1, c_3
  )
  + a_3 det mat(
    b_1, b_2;
    c_1, c_2
  ).
  $
]

#definition[
  Let $bold(A)$ be a square matrix. The $(i,j)$-*minor* of $bold(A)$, denoted
  $M_(i j)$, is the determinant of the matrix obtained from $bold(A)$ by deleting
  the $i$th row and the $j$th column.
]

#definition[
  Let $bold(A)$ be a square matrix. The $(i,j)$-*cofactor* of $bold(A)$, denoted
  $C_(i j)$, is defined by
  $
  C_(i j) = (-1)^(i+j) M_(i j).
  $
]

#definition[
  Let $bold(A) = (a_(i j))$ be an $m times n$ matrix. The *transpose* of
  $bold(A)$, denoted $bold(A)^T$, is the $n times m$ matrix whose $(i,j)$-entry
  is
  $
  (bold(A)^T)_(i j) = a_(j i).
  $
]

The determinant measures how a square matrix scales signed area in two dimensions
and signed volume in three dimensions.


Matrix algebra satisfies many properties for a nice algebraic structure. 
+ Associative
  #theorem[
    In other words, if $bold(X)$ is a vector and $bold(A)$ and $bold(B)$ are matrices, $ (bold(A B)) bold(X) = bold(A) (bold(B X)). $
  ]

  This theorem could be interpreted with the lens of matrices as transformations. The transformation $bold(A B)$ is equivalent to applying the transformation described by $bold(A)$ first, then transformation described by matrix $bold(A)$. 

+ Commutative
  However, note that $bold(A B) != bold(B A)$, which makes sense after the above theorem. In fact, given $bold(A B)$, $bold(B A)$ is not even necessarily well-defined. 

+ Multiplicative Identity
  There exist an unique identity fixing the height of the matrix being multiplied, with $1$ along the diagonal and $0$ elsewhere.
  Denote it as $bold(X)$, we have $ bold(I X) = bold(X).  $

  + Multiplicative Inverse
    #definition[For a matrix $bold(A)$, matrix $bold(M)$ is its inverse iff $bold(A M) = bold(M A) = bold(I)$, where $bold(I)$ is the identity matrix. ]
    Observe that a matrix has an inverse only if it is a square matrix, meaning it has the same number of rows and columns. In fact, any square matrix with a non-zero determinant has an inverse. 
    Furthermore, finding the solution to a system of linear equations is equivalent to finding the inverse of a matrix. 
    Consider a system of linear equations regarding $n$ variables. If $bold(A)$ is an n-by-n square matrix representing the coefficients of the variables in each equation, $bold(X)$ a vector representing the solutions, and $bold(B)$ representing the vector of the constants on the right side of the equations, then we have $ bold(A X) = bold(B) ==> bold(A)^(-1) bold(A X) = bold(A)^(-1) bold(B) ==> bold(X) = bold(A)^(-1) bold(B) $

    Thus, how to find the inverse of a matrix becomes a natural question. Here, I claim, without proof, that if the adjunct matrix of a square matrix $bold(A)$ is obtained by taking the transpose of the co-factor of the minors of $bold(A)$, then $ bold(A)^(-1) = 1/(det bold(A)) op("adj")(bold(A)). $

#example[
  Consider the matrix

  $
  R = mat(
    0, -1;
    1, 0
  ).
  $

  Then

  $
  R mat(x; y)
  =
  mat(
    -y;
    x
  ),
  $

  so $R$ rotates every vector in the plane by $90 degree$
  counterclockwise about the origin.

  In particular,

  $
  R mat(1; 0)
  =
  mat(0; 1),
  $

  and

  $
  R mat(0; 1)
  =
  mat(-1; 0).
  $

Thus, a system described by $hat(bold(i))$ and $hat(bold(j))$ is mapped to a system of $hat(bold(j))$ and $-hat(bold(j))$. Therefore, $90^degree$ counterclockwise. 
]