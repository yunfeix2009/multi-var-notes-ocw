#import "/lib.typ" : *
= Quadric Surfaces


#theorem[
  i hate people like you
]
#proof[
  dhgljkfhgldfkjghdfsjklgdfskljg fsdjg sdfg dfskldfljkgdfskljg dfsjk gdsjkg dfsjkl dfsjkghdf sljgdfsjk dsfg dfsjkghdfsjkghdsfklj gds gdfsg dfs gjdfs hjfdslgkdfshgkl dfg dfsjg dfskljg dfjksg. hfd ghfd  dgjg dfljgh dslgkds lksd flds lsd jkldf jkf gjkdf gkjd kjdf gdfkg d j  fjfd gjdf gjdf gjfd $ dif partial/dif d i h diff qedhere $
]


#cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *

  plot.plot(size: (8, 6), axis-style: "school-book", {
    plot.add(
      domain: (-0.3, 0.3),
      x => calc.pow(x, 2) * calc.sin(1 / x),
      samples: 200,
    )
  })
})
