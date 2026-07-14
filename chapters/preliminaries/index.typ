
#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Preliminaries",
  route: "prelim",

  children: [
    #include "double-integrals/index.typ"
    #include "polar-coordinates/index.typ"
    #include "double-int-application/index.typ"
    #include "change-of-variables/index.typ"
    #include "line-integrals/index.typ"
    #include "triple-integrals/index.typ"
    #include "spherical-coordinates/index.typ"
  ],
)

= Preliminaries
By way of introducing the subject, we first introduce several pertinent operations that will recur throughout the subject. Accordingly, we first redefine the many concepts in a higher Euclidean space, such as

#chapter-section("dot_product")[
  #include "dot-product/index.typ"
]
#chapter-section("dot_product_applications")[
  #include "dot-product-applications/index.typ"

]
#chapter-section("matrices")[
  #include "matrices/index.typ"
]
#chapter-section("cross_product")[
  #include "cross-product/index.typ"
]

#chapter-section("parametric")[
  #include "parametrics/index.typ"
]
