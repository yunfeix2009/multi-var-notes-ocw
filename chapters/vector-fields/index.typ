#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Vector Fields",
  route: "vector-fields",
  children: [
    #include "fundamentals/index.typ"
    #include "conservative-fields/index.typ"
    #include "curl/index.typ"
    #include "green/index.typ"
    #include "flux/index.typ"
    #include "simply-connected-regions/index.typ"
  ],
)

Here, we examine the concepts of vector fields using techniques developed from differentiation and integration of functions with more than one variables.
