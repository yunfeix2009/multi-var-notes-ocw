
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Dot Product Applications",
  route: "dot-app",
)
+ One of the most frequent applications of dot product is converting between lengths and angles and coordinates.

  #example[
    Consider points $P, Q, R in RR^3: P = (1, 0, 0), R = (0, 0, 2), Q = (0, 1, 0).$ Find $angle R P Q.$

  ]<ex:dot-product-angle-1>
  #solution[of @ex:dot-product-angle-1][
    Express in terms of vectors, $va(P R) = va(R) - va(P) = (-1, 0, 2)$ and $va(P Q) = va(Q) - va(P) = (-1, 1, 0)$. Therefore, let $theta := angle R P Q$, $va(P R) dot va(P Q) = norm(va(P R)) norm(va(P Q)) cos theta$. Thus,
    $ theta = cos^(-1) (((-1, 0, 2) dot (-1, 1, 0))/(norm((-1, 0, 2)) norm((-1, 1, 0)))) = 1/sqrt(10). #qedhere $
  ]
  #example[Pset 1 Part II p1][
    Find the dihedral angle between two faces of a regular tetrahedron.
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

  #corollary[
    For a plane defined by $a x + b y + c z = 0$, it's normal vector is $mat(a; b; c)$.
  ]

  This result could be generalized to surfaces beyond planes, See @thm:normal-vector-gradient and @thm:normal-vector-cross.

  #theorem[
    Three planes intersect at a point iff their normal vectors are coplanar.
  ]
  #proof[
    Left as an exercise.
  ]
+ In Physics, when dealing with force, dot  product is often critical.
  #example[
    #let is-html = sys.inputs.at("html", default: "false") == "true"
    #let boat-image = image("/assets/image.png", width: 100%)

    #if is-html [
      #html.elem("div", attrs: (class: "boat-reflow"), {
        html.elem("div", attrs: (class: "boat-reflow-text"), [
          Background: By carefully positioning the sail the boat can be made to sail
          into the wind – this process is called _tacking_.

          Described mathematically, the wind vector is first projected onto the
          perpendicular to the sail to obtain the direction of the force on the sail.
          This resultant force is then projected onto the axis of the boat to determine
          the direction in which the boat is being pushed. By orienting the sail
          correctly, this double projection can result in a vector with a component
          pointing into the wind.

          In the figure, $bold(w) = a bold(i)$ is the wind direction. The line $l_s$
          is perpendicular to the sail $(0 <= alpha < pi/2)$, and the line $l_B$ lies
          along the boat's axis $(0 <= beta < pi/2)$.
        ])
        html.elem("div", attrs: (class: "boat-reflow-figure"), [
          #boat-image
        ])
      })
    ] else [
      #let image1 = image("/assets/image.png", width: 53%)
      #reflow({
        placed(horizon + right, dy: -6.7cm, dx: 3%, image1)

        container()
        content[
          #set par(justify: true)
          Background: By carefully positioning the
          sail the boat can be made to sail into the wind – this process is called _tacking_.

          Described mathematically, the wind vector is first projected onto the
          perpendicular to the sail to obtain the direction of the force on the sail.
          This resultant force is then projected onto the axis of the boat to determine
          the direction in which the boat is being pushed. By orienting the sail
          correctly, this double projection can result in a vector with a component
          pointing into the wind.

          In the figure, $bold(w) = a bold(i)$ is the wind direction. The line $l_s$
          is perpendicular to the sail $(0 <= alpha < pi/2)$, and the line $l_B$ lies
          along the boat's axis $(0 <= beta < pi/2)$.
        ]
      })
    ]
    a) Let $bold(w)_1$ be the projection of $bold(w)$ onto the line $l_s$.
    Show that $bold(w)_1$ does not have a non-zero component in the
    direction opposite $bold(w)$. (It is sufficient to show the projections
    on the sketch.)

    b) Find the projection of $bold(w)_1$ onto $l_B$.
    (Give an explicit formula in terms of $alpha$ and $beta$.) What is the condition on $alpha$ and $beta$ that this projection
    has a component in the $-bold(i)$ direction?
    (For warmup you might try the specific case
    $alpha = pi/3 = beta$.)
  ]
  #solution[
    (a) omitted due to simplicity.
    (b) The magnitude is $ norm(a hat(bold(i))) sin alpha sin beta = a sin alpha sin beta, $
    while the direction is along $l_bold(B).$
    geometrically, there is a $- hat(bold(i))$ component iff $alpha + beta > 90^compose$
  ]

#remark[
  In fact, the component of the force against the wind (in the $-vu(i)$ direction) is $vb(F)(alpha, beta) = a cos alpha cos beta (-cos(alpha + beta))$. Then, one could show that the $vb(F)$ is maximized when $alpha = beta = pi/3$ and $vb(F) = a/8$ in that case.
]

