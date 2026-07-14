#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Differentiation",
  route: "diff",
  description: "differentiation of multiple variables",

  children: [
    #include "fundamentals/index.typ"
    #include "geometric-lens/index.typ"
    #include "extremum/index.typ"
    #include "differentials/index.typ"
    #include "chain-rule/index.typ"
    #include "gradient/index.typ"
    #include "directional-derivative/index.typ"
    #include "lagrange-multipliers/index.typ"
    #include "non-independent-variables/index.typ"
    #include "partial-differential-equations/index.typ"

  ],
)
Here, we examine the concepts related to the differentiation of functions with more than one variables along with their applications.
