#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#import "@local/ctheorems:2.0.0": *
#import "@preview/physica:0.9.8" : *
#let oldpagebreak = pagebreak
#import "@preview/meander:0.4.3" : *
// #import "@preview/lilaq:0.6.0" : *

#import thm-themes.ams: *

#let _ams-theorem = theorem
#let _ams-lemma = lemma
#let _ams-proposition = proposition
#let _ams-corollary = corollary
#let _ams-conjecture = conjecture
#let _ams-definition = definition
#let _ams-problem = problem
#let _ams-remark = remark
#let _ams-example = example
#let _ams-claim = claim
#let _ams-proof = proof

#let _is-html = sys.inputs.at("html", default: "false") == "true"

#let section-numbering-depth = 2

#let _heading-numbers(depth: section-numbering-depth, loc: none) = {
  let arr = if loc != none {
    counter(heading).at(loc)
  } else {
    counter(heading).get()
  }
  arr.slice(0, calc.min(depth, arr.len()))
}

#let _scoped-number(value, depth: section-numbering-depth, loc: none) = {
  let nums = _heading-numbers(depth: depth, loc: loc)
  let scoped = nums + (value,)
  scoped.map(str).join(".")
}

#let reset-heading-scoped-counters() = {
  counter(footnote).update(0)
  counter(math.equation).update(0)
}

#let scoped-equation-numbering(..args) = [(#_scoped-number(args.at(0)))]

#let heading-reset-marker(level) = context if level <= section-numbering-depth {
  reset-heading-scoped-counters()
}

#let _plain-thm-fmt = thm-fmt-block.with(
  name-fmt: x => emph(smallcaps([(#x)])),
)

#let _html-thm-fmt(head, css-class, numbered: true) = thm => {
  let title = if numbered and thm.number != none {
    [#head #thm.number]
  } else {
    [#head]
  }

  html.elem("div", attrs: (class: "thm-box " + css-class), {
    html.elem("p", attrs: (class: "thm-head"), {
      html.elem("strong", title)
      if thm.name != none [ (#thm.name)]
      [.]
    })
    thm.body
  })
}

#let _html-thm-env(env, head, css-class, numbered: true) = env.with(
  fmt: _html-thm-fmt(head, css-class, numbered: numbered),
)

#let _html-proof-fmt(head) = thm => {
  let title = if thm.name != none {
    [#head #thm.name]
  } else {
    [#head]
  }

  html.elem("div", attrs: (class: "thm-proof"), {
    html.elem("p", attrs: (class: "proof-head"), html.elem("em", [#title.]))
    thm.body
    html.elem("p", attrs: (class: "qed"), [$square$])
  })
}

#let theorem = if _is-html {
  _html-thm-env(_ams-theorem, "Theorem", "thm-theorem")
} else {
  _ams-theorem.with(fmt: _plain-thm-fmt)
}

#let lemma = if _is-html {
  _html-thm-env(_ams-lemma, "Lemma", "thm-lemma")
} else {
  _ams-lemma.with(fmt: _plain-thm-fmt)
}

#let proposition = if _is-html {
  _html-thm-env(_ams-proposition, "Proposition", "thm-proposition")
} else {
  _ams-proposition.with(fmt: _plain-thm-fmt)
}

#let corollary = if _is-html {
  _html-thm-env(_ams-corollary, "Corollary", "thm-corollary")
} else {
  _ams-corollary.with(fmt: _plain-thm-fmt)
}

#let conjecture = if _is-html {
  _html-thm-env(_ams-conjecture, "Conjecture", "thm-conjecture")
} else {
  _ams-conjecture.with(fmt: _plain-thm-fmt)
}

#let definition = if _is-html {
  _html-thm-env(_ams-definition, "Definition", "thm-definition")
} else {
  _ams-definition
}

#let problem = if _is-html {
  _html-thm-env(_ams-problem, "Problem", "thm-problem")
} else {
  _ams-problem
}

#let remark = if _is-html {
  _html-thm-env(_ams-remark, "Remark", "thm-remark", numbered: false)
} else {
  _ams-remark
}

#let example = if _is-html {
  _html-thm-env(_ams-example, "Example", "thm-example")
} else {
  _ams-example
}

#let claim = if _is-html {
  _html-thm-env(_ams-claim, "Claim", "thm-claim", numbered: false)
} else {
  _ams-claim
}

#let proof = if _is-html {
  _ams-proof.with(fmt: _html-proof-fmt("Proof"))
} else {
  _ams-proof
}

#if _is-html {
  qedhere = none
}

#let chapter-section(id, depth: auto, body) = context {
  if _is-html {
    let nav-depth = if depth == auto { none } else { str(depth) }
    let attrs = if nav-depth == none {
      (class: "chapter", id: id)
    } else {
      (class: "chapter", id: id, "data-nav-depth": nav-depth)
    }
    html.elem("section", attrs: attrs, body)
  } else {
    body
  }
}
