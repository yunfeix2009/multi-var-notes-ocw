#import "/lib.typ" : *
#let show-rules(doc) = {
  show: thm-rules.with(qed-symbol: $square$)
  set par(justify: true)
  set page(numbering: "1")
  doc
}