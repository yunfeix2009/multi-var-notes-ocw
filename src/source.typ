#let title = "Notes on Multivariable Calculus"
#let course = "MIT OpenCourseWare 18.02"
#let authors = "Saint Even and Slipper King"
#let date = "June 2026"
#let abstract = [
  #quote[Change]
  #context {
    if target() == "paged" {
      align(center)[#quote[Change!]]
    } else {
      html.elem("div", attrs: (style: "text-align: right;padding-bottom: 0.5rem"), [#quote[Change!]])
    }
  }

  For those who have just finished calculus and want to learn multivariable calculus without taking a formal class or working through a full textbook, but would rather read a lighter set of notes:

  This set of notes multivariable calculus intended to serve as the starting point of the study in the series of multivariable calculus, linear algebra, and differential equation -- three subjects I believe together make a strong foundation as the math prerequisite of .

  Calculus of several variables. Vector algebra in 3-space, determinants, matrices. Vector-valued functions of one variable, space motion. Scalar functions of several variables: partial differentiation, gradient, optimization techniques. Double integrals and line integrals in the plane; exact differentials and conservative fields; Green's theorem and applications, triple integrals, line and surface integrals in space, Divergence theorem, Stokes' theorem; applications.
]

#let web-view-recommendation = [
  For the best web viewing experience, we recommend using a Mozilla-based browser such as Firefox. This will be subject to change as browsers improve their MathML support.
]

#let source-url = "https://github.com/yunfeix2009/multi-var-notes-ocw"

#let web-cover(href) = {
  html.elem("section", attrs: (class: "cover"), {
    html.elem("p", attrs: (class: "course"), course)
    html.elem("h1", title)
    html.elem("p", attrs: (class: "authors"), [by #smallcaps[Saint Even] and #smallcaps[Slipper King]])
    html.elem("p", attrs: (class: "date"), date)
    html.elem("div", attrs: (class: "abstract"), abstract)
    html.elem("div", attrs: (class: "recommendation"), web-view-recommendation)
    html.elem("p", attrs: (class: "download"), {
      html.elem("a", attrs: (class: "button", href: href("pdf/notes.pdf")), [Download PDF])
    })
  })
}

#let pdf-cover(outline-target: heading) = [
  #set document(
    title: title,
    author: authors,
  )
  #align(center)[
    #v(2cm)
    #box[#text(size: 20pt, weight: "bold")[#title]]

    #text(size: 13pt)[#course]

    #text(size: 13pt)[#smallcaps[#authors]]

    #text(size: 11pt)[#date]

    #raw("Source: " + source-url)
  ]

  #block(inset: 10pt)[#abstract]
  #outline(target: outline-target)
]
