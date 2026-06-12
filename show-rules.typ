#import "/lib.typ" : *
#import "/packages/local/ctheorems/2.0.0/src/thm.typ": thm-qed-show
#let show-rules(doc) = {
  show: thm-rules.with(qed-symbol: $square$)
  show math.equation: eq => {
    show metadata.where(value: "thm-qedhere"): tag(thm-qed-show)
    show metadata: data => {
      if type(data.value) == dictionary and data.value.keys().contains("eq-tag") {
        context {
          let pos-numbering = query(metadata.where(value: "thm-equation-numbering").after(eq.location())).first().location().position()
          let pos-here = here().position()
          let width = measure(data.value.eq-tag).width
          let dx = -pos-here.x + pos-numbering.x - width
          if data.value.move {
            move(dx: dx, data.value.eq-tag)
          } else {
            place(horizon, dx: dx, data.value.eq-tag)
          }
        }
      } else {
        data
      }
    }

    if eq.fields().keys().contains("label") {
      math.equation(
        block: true,
        numbering: scoped-equation-numbering,
        number-align: eq.number-align,
        supplement: eq.supplement,
        eq.body,
      )
    } else if eq.numbering == none {
      math.equation(
        block: eq.block,
        numbering: x => {
          metadata("thm-equation-numbering")
        },
        number-align: eq.number-align,
        supplement: eq.supplement,
        eq.body,
      )
    } else {
      eq
    }
  }

  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      let eq-num = counter(math.equation).at(el.location()).at(0) + 1
      link(el.location(), [(#_scoped-number(eq-num, loc: el.location()))])
    } else {
      it
    }
  }

  set par(justify: true)
  set heading(numbering: "1.1")
  set page(numbering: "1", margin: 1.75in)

  set figure(placement: alignment.top)
  show figure.caption: it => context [
    *#it.supplement~#it.counter.display()#it.separator*#it.body
  ]

  show heading: it => context {
    if target() != "html" {
      return [#it#heading-reset-marker(it.level)]
    }

    let level = calc.min(it.level, 6)
    let tag = ("h1", "h2", "h3", "h4", "h5", "h6").at(level - 1)
    let num-display = if it.numbering != none {
      if level == 1 {
        [Chapter ] + counter(heading).display() + [: ]
      } else if level <= 6 {
        counter(heading).display() + [ ]
      }
    }
    let label-id = if it.has("label") { str(it.label) } else { none }
    let content = [#num-display#it.body]
    let rendered = if label-id != none {
      html.elem(tag, attrs: (id: label-id), content)
    } else {
      html.elem(tag, content)
    }
    [#rendered#heading-reset-marker(it.level)]
  }

  show math.equation.where(block: false): it => context {
    if target() == "html" {
      box(html.frame(it))
    } else {
      it
    }
  }

  show math.equation.where(block: true): it => context {
    if target() == "html" {
      html.elem(
        "div",
        attrs: (
          style: "display: block; margin-left: auto; margin-right: auto; align-self: center; margin-bottom: 16px",
        ),
      )[
        #html.frame(it)
      ]
    } else {
      it
    }
  }

  // show grid: it => context {
  //   if target() == "html" {
  //     if (measure(it).width <= 360pt) {
  //       html.frame(block(it))
  //     } else {
  //       html.frame(block(width: 360pt, it))
  //     }
  //   } else {
  //     it
  //   }
  // }

  doc
}
