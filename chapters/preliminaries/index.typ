
#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Preliminaries",
  route: "preliminaries",

  children: [
    #include "dot-product/index.typ"
    #include "dot-product-applications/index.typ"
    #include "matrices/index.typ"
    #include "cross-product/index.typ"
    #include "parametrics/index.typ"
  ],
)

By way of introducing the subject, we first introduce several pertinent operations that will recur throughout the subject. Accordingly, we first redefine the many concepts in a higher Euclidean space, such as
