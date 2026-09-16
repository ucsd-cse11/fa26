// ===========================================================================
// The course, as data. Everything the site renders comes from this file.
// Fields hold content (`[...]`), not strings, wherever markup belongs.
// No html.elem here — keeping this file target-agnostic is what lets
// `typst eval` read it in paged mode for .ics/PrairieLearn/etc.
// ===========================================================================

#let intro = [
  This page is under construction until the first class on Sep 24.
  Welcome to CSE11!
  
]

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

#let doodle = none   // path to an image, or none

#let quick-links = (
  (label: [🙋 Piazza], href: "https://piazza.com/ucsd/fall2026/cse11"),
  (label: [🗓️ Office hours], href: "#staff"),
  (label: [📥 Gradescope], href: "https://www.gradescope.com/courses/1387459"),
  (label: [🖥️ PrairieLearn], href: "https://us.prairielearn.com"),
)

#let staff = (
  (name: "Ben Ochoa", role: [Instructor], href: none, hours: [Coming soon]),
  (name: "Joe Politz", role: [Instructor], href: "https://jpolitz.github.io", hours: [Coming soon]),
  (name: "Staff", role: [TAs and Tutors], href: none, hours: [Coming soon]),
)

// --------------------------------------------------------------- the calendar
// One flat array. `kind` picks the lozenge and the lane; `due`-kind items
// render in the right-hand lane of their week.

#let d(m, day) = datetime(year: 2026, month: m, day: day)

#let sessions = (
  // week 1
  (date: d(9, 24), kind: "lecture", n: 1, title: [Programs and values],
   href: none),
)
