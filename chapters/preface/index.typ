#import "/src/components/index.typ": docs-frontmatter
#import "/lib.typ": *

#show: docs-frontmatter.with(
  title: "Preface",
  route: "preface",
  description: "A short orientation to the course notes.",
)
// For those who consider themselves as fluent in calculus and want to learn differential equations without taking a formal class or working through a full textbook, but would rather read a lighter set of notes:

// This is a set of notes mainly is mainly based on MIT OpenCourseWare 18.03 @ocwlinkde, Differential Equations, specifically lectures by Prof. Arthur Mattuck, recorded in Spring, 2006 and problems from its problem set. When the source of an example problem is not otherwise stated, it may be assumed to be from the problem sets of this course.

// Topics of study in this course, by virtue of MIT Registrar's Office, is as following. #quote[Study of differential equations, including modeling physical systems. Solution of first-order ODEs by analytical, graphical, and numerical methods. Linear ODEs with constant coefficients. Complex numbers and exponentials. Inhomogeneous equations: polynomial, sinusoidal, and exponential inputs. Oscillations, damping, resonance. Fourier series. Matrices, eigenvalues, eigenvectors, diagonalization. First order linear systems: normal modes, matrix exponentials, variation of parameters. Heat equation, wave equation. Nonlinear autonomous systems: critical point analysis, phase plane diagrams.] @mit_registrar_course18_fall2026

// Emphasis would be placed on topics that cultivate generalizable insights with broad applicability across science and engineering, similar to the theory of eigenvectors in linear algebra. Conversely, techniques that are easily delegated to computational tools and contribute little transferable understanding would receive less emphasis.

// This set of notes is best served when the audience is well-versed in topics from 18.01, Single Variable Calculus, @jerison2010calc, that may be substituted with a mastery of high school calculus concept (by the BC curriculum, for example). Several topics from 18.02 @Auroux2007MultivariableCalculus, Multivariable Calculus, are helpful to know, for which we have provided a corresponding set of notes at @saint_multivariable_calculus_notes.

// Moreover, due to Gilbert Strang's convincing argument that emphasize the collaboration of linear algebra and differential equations, this set of notes will also borrow ideas from 18.009, @mit_ocw_differential_equations_linear_algebra along with the book  @strang2015differential, developing the two subjects together. To this end, we also have _Notes on Linear Algebra_ @saint_even_linear_algebra_notes_2026, based on to 18.06 @strang2010mit1806  and _Introduction to Linear Algebra_ by Gilbert Strang @strang2023linear, that may serve as supplements on linear algebra.
