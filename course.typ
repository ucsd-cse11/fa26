// ===========================================================================
// The course, as data. Everything the site renders comes from this file.
// Fields hold content (`[...]`), not strings, wherever markup belongs.
// No html.elem here — keeping this file target-agnostic is what lets
// `typst eval` read it in paged mode for .ics/PrairieLearn/etc.
// ===========================================================================

#let term = (
  course: "CSE 11",
  name: "Fall 2026",
  title: "Introduction to Programming and Computational Problem-Solving",
  start: datetime(year: 2026, month: 9, day: 22),   // Tuesday of week 1
  weeks: 10,
  weeks-descending: true,   // reverse-chronological; flip for forward order
  // Build-time "now". datetime.today() makes the current-week highlight
  // follow the clock, at the cost of a non-reproducible build; pin a date
  // here to make it deterministic (tests do this).
  today: datetime(year: 2026, month: 10, day: 7),  // PROTOTYPE: pinned mid-term so the
  // current-week highlight is visible. Swap to datetime.today() for real.
)

#let intro = [
  An accelerated introduction to programming in Java: data design, testing,
  and the judgment calls that separate code you would stand behind from code
  that merely runs. Class time is split between comparative judgment exercises
  on paper and live coding.
]

#let doodle = none   // path to an image, or none

#let quick-links = (
  (label: [Ed], href: "https://edstem.org", note: [questions]),
  (label: [Office hours], href: "#staff", note: [queue + calendar]),
  (label: [Gradescope], href: "https://gradescope.com", note: [submit]),
  (label: [PrairieLearn], href: "https://us.prairielearn.com", note: [quizzes]),
  (label: [The book], href: "https://ucsd-cse11.github.io/book/", note: [runs Java in the browser]),
)

#let policies = (
  (label: [Syllabus], href: "syllabus.html"),
  (label: [Grading], href: "syllabus.html#grading"),
  (label: [Collaboration and LLMs], href: "syllabus.html#collaboration"),
  (label: [Academic integrity], href: "syllabus.html#integrity"),
  (label: [Accommodations], href: "syllabus.html#accommodations"),
)

#let staff = (
  (name: "Joe Politz", role: [Instructor], href: "https://jpolitz.github.io", hours: [Tue 2–3, CSE 3216]),
  (name: "Ben Ochoa", role: [Instructor], href: none, hours: [Wed 11–12]),
  (name: "TA staff", role: [12 tutors + 2 TAs], href: "staff.html", hours: [see calendar]),
)

// --------------------------------------------------------------- the calendar
// One flat array. `kind` picks the lozenge and the lane; `due`-kind items
// render in the right-hand lane of their week.

#let d(m, day) = datetime(year: 2026, month: m, day: day)

#let sessions = (
  // week 1
  (date: d(9, 22), kind: "lecture", n: 1, title: [Programs and values],
   href: "lectures/01.html",
   extras: ((label: [slides], href: "assets/lec/01.pdf"), (label: [code], href: "code/01/")),
   reading: [ch. 1]),
  (date: d(9, 23), kind: "lab", n: 1, title: [Setup, and your first program],
   href: "labs/01.html"),
  (date: d(9, 24), kind: "lecture", n: 2, title: [Data that travels together],
   href: "lectures/02.html",
   extras: ((label: [slides], href: "assets/lec/02.pdf"),),
   reading: [ch. 2], note: [`record`, and why structural equality comes for free.]),
  (date: d(9, 25), kind: "due", title: [PA 0 — hello, tooling], href: "pa/00.html"),

  // week 2
  (date: d(9, 29), kind: "lecture", n: 3, title: [Methods, examples, tests],
   href: "lectures/03.html",
   extras: ((label: [slides], href: "assets/lec/03.pdf"), (label: [code], href: "code/03/")),
   reading: [ch. 3]),
  (date: d(9, 30), kind: "lab", n: 2, title: [Writing the examples first],
   href: "labs/02.html"),
  (date: d(10, 1), kind: "lecture", n: 4, title: [Pictures as data],
   href: "lectures/04.html",
   extras: ((label: [slides], href: "assets/lec/04.pdf"),),
   reading: [ch. 4], note: [Composition as a tree; rendering as the bridge to pixels.]),
  (date: d(10, 2), kind: "due", title: [PA 1 — a flag of your own], href: "pa/01.html"),

  // week 3
  (date: d(10, 6), kind: "lecture", n: 5, title: [Unions, and open interfaces],
   href: "lectures/05.html",
   extras: ((label: [slides], href: "assets/lec/05.pdf"),), reading: [ch. 5]),
  (date: d(10, 7), kind: "lab", n: 3, title: [Adding a variant], href: "labs/03.html"),
  (date: d(10, 8), kind: "lecture", n: 6, title: [Dynamic dispatch],
   href: "lectures/06.html", reading: [ch. 5.3]),
  (date: d(10, 8), kind: "exam", title: [Quiz 1], href: "exams.html#q1",
   note: [Testing center, Thu–Sat. Built from your own PA 1 submission.]),

  // week 4
  (date: d(10, 13), kind: "lecture", n: 7, title: [Recursive data],
   href: "lectures/07.html", reading: [ch. 6]),
  (date: d(10, 14), kind: "lab", n: 4, title: [Lists, by hand], href: "labs/04.html"),
  (date: d(10, 15), kind: "lecture", n: 8, title: [Generic containers],
   href: "lectures/08.html", reading: [ch. 7],
   note: [Where the `<T>` comes from, and what it buys.]),
  (date: d(10, 16), kind: "due", title: [PA 2 — representing posts], href: "pa/02.html"),
)
