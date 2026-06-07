#import "/lib.typ": *

== Dot Product Applications

+ One of the first fundamental applications of dot product is converting between lengths and angles and coordinates.
  // #theorem[
  //   $"game" = "lost"$
  // ]
  #example[
    Consider points $P, Q, R in RR^3: P = (1, 0, 0), R = (0, 0, 2), Q = (0, 1, 0).$ Find $angle R P Q.$

  ]<ex:dot-product-angle-1>
  #solution[of @ex:dot-product-angle-1][
    Express in terms of vectors, $va(P R) = va(R) - va(P) = (-1, 0, 2)$ and $va(P Q) = va(Q) - va(P) = (-1, 1, 0)$. Therefore, $theta := angle R P Q$, $va(P R) dot va(P Q) = norm(va(P R)) norm(va(P Q) cos theta)$. Thus,
    $ theta = cos^-1 (((-1, 0, 2) dot (-1, 1, 0))/(norm((-1, 0, 2)) norm((-1, 1, 0)))) = 1/sqrt(10). $
  ]
  #example[
    (Pset 1 Part II p1) Find the dihedral angle between two faces of a regular tetrahedron.
  ]
  #solution[
    Since all of the dihedral angles are equal (regular tetrahedron), we only need to find one such angle.

    Method 1: Fix one face as the base and have its center to be the origin in the $RR^3$ space while it lies in the x-y plane with one vertex at (0, 1, 0). $ A := (0, 1, 0), B := (0, -1/2, 0), C := (0, 0, sqrt(2)). $
    Then the desired angle $angle A B C$ could be computed as @ex:dot-product-angle-1.

    Method 2: Notice the dihedral angle between two planes is equal to the angle between their normal vectors, we only need to compute the angle between two normal vectors. $ va(B C) = (0, -sqrt(3), 0),
    quad
    va(B D) = (1/2, -sqrt(3)/2, sqrt(2)), $

    $ bold(n)_2
    = va(B C) times va(B D)
    = (-sqrt(6), 0, -sqrt(3)/2)
    tilde (-2 sqrt(2), 0, -1). $ Thus, the angle could be computed with @thm:dot-product-geo.
  ]
+ Dot product is pivotal in dealing with surfaces.
  #example[
    Fix $a, b, c in RR$, show that the surface defined by $a x + b y + c z = 0$ is a plane.
  ] <ex:dot-product-angle-2>
  #solution[of @ex:dot-product-angle-2][
    Notice that the surface definition is $ {mat(x; y; z) : mat(a; b; c) dot mat(x; y; z) = 0}. $
    Geometrically, this is all vectors that are orthogonal to a fixed vector $mat(a; b; c)$, therefore a plane.
  ]

  #corollary[of @ex:dot-product-angle-2][
    For a plane defined by $a x + b y + c z = 0$, it's normal vector is $mat(a; b; c)$.
  ]

  This result could be generalized to surfaces beyond planes.
  #theorem[
    The normal vector at a point $(x_0, y_0, z_0)$ wrt a surface that is implicitly defined by $F(x, y, z) = 0$ is $nabla F(x_0, y_0, z_0)$.
  ]
  #proof[
    Denote the surface as $S$ and the normal vector $vb(n)$. Consider an arbitrary curve $gamma subset S$ that is parametrized by $gamma(t)$ and passes through $(x_0, y_0, z_0)$,  since $vb(n)$ is orthogonal to $gamma$ at $(x_0, y_0, z_0)$, we have $dv(gamma, t) dot vb(n) = 0$. Since $gamma subset S$, for any $t$, $(F compose gamma)(t) = 0$, and thus $F compose gamma$ is constant. Hence, $pdv(F compose gamma, t) =0$. However, $pdv(F compose gamma, t) =$
  ]
#theorem[
  The normal vector at a point $(u_0, v_0)$ wrt a surface that is defined by $vb(r) (u, v)$ is $nabla F(u) times nabla F(v)$, where $vb(r)$ is a 3D vector.
]




