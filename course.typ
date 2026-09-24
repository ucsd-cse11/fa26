// ===========================================================================
// The course, as data. Everything the site renders comes from this file.
// Fields hold content (`[...]`), not strings, wherever markup belongs.
// No html.elem here — keeping this file target-agnostic is what lets
// `typst eval` read it in paged mode for .ics/PrairieLearn/etc.
// ===========================================================================

#let intro = [
  Welcome to CSE11! This quarter we will explore programming in Java in an
  object-oriented style, with a focus on representing, specifying, testing, and
  breaking down open-ended computational problems.
]
#let term = (
  course: "CSE 11",
  name: "Fall 2026",
  title: "Introduction to Programming and Computational Problem-Solving",
  start: datetime(year: 2026, month: 9, day: 28),   // Monday of week 1
  weeks: 10,
  weeks-descending: false,   // reverse-chronological; flip for forward order
  // Build-time "now". datetime.today() makes the current-week highlight
  // follow the clock, at the cost of a non-reproducible build; pin a date
  // here to make it deterministic (tests do this).
  today: datetime.today()
  // current-week highlight is visible. Swap to datetime.today() for real.
)

#let doodle = none   // path to an image, or none

#let quick-links = (
  (label: [🏠 Course Home], href: "index.html"),
  (label: [✅ Syllabus], href: "syllabus.html"),
  (label: [🙋 Piazza], href: "https://piazza.com/class/mu7d4ro26uc7dl"),
  (label: [🗓️ Office hours (coming soon)], href: "#staff"),
  (label: [📥 Gradescope], href: "https://www.gradescope.com/courses/1404864"),
  (label: [🖥️ PrairieLearn], href: "https://us.prairielearn.com"),
)

#let staff = (
  (name: "Ben Ochoa", role: [Instructor], href: "https://cseweb.ucsd.edu/~bochoa/", hours: [Coming soon]),
  (name: "Joe Politz", role: [Instructor], href: "https://jpolitz.github.io", hours: [Office hours: Wed 9-10:00am, CSE3206]),
  (name: "Staff", role: [TAs and Tutors], href: none, hours: [Coming soon]),
)

// --------------------------------------------------------------- the calendar
// One flat array. `kind` picks the lozenge and the lane; `due`-kind items
// render in the right-hand lane of their week.

#let d(m, day) = datetime(year: 2026, month: m, day: day)


/*
┌─────────┬──────┬──────────────────────────────────────────────────┬─────────────────────────────────────────────────────────────┐
│  field  │ req? │                       type                       │                           effect                            │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ date    │ yes  │ datetime (use the d(month, day) helper)          │ picks the week and the row                                  │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ kind    │ yes  │ string                                           │ lozenge color + which lane                                  │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ title   │ yes  │ content [...]                                    │ the main text                                               │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ n       │ no   │ int                                              │ appended to the label: Lecture 1. Omit → bare Lecture       │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ who     │ no   │ content or string, default none                  │ dimmed lozenge, after the kind lozenge                      │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ href    │ no   │ string, default none                             │ makes the title a link                                      │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ extras  │ no   │ array of (label: content, href: str), default () │ small parenthesized links after the title — (slides) (code) │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ reading │ no   │ content, default none                            │ inline, muted, prefixed ·                                   │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ note    │ no   │ content, default none                            │ muted line below the entry                                  │
├─────────┼──────┼──────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────┤
│ time    │ no   │ string, default none                             │ appended to the lozenge: Due 9:30am                         │
└─────────┴──────┴──────────────────────────────────────────────────┴─────────────────────────────────────────────────────────────┘
*/

#let sessions = (
  (date: d(9, 24), kind: "lecture", n: 0, who: "Joe", title: [Programs and values], href: none,
   extras: ((label: [worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/definitions-and-values.pdf"),)),

  (date: d(9, 28), kind: "lecture", n: 1, who: "Ben", title: [Programs and values], href: none,
   extras: ((label: [worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/definitions-and-values.pdf"),)),
  (date: d(9, 29), kind: "lecture", n: 2, who: "Joe", title: [Records and methods], href: none),
  (date: d(9, 30), kind: "lecture", n: 2, who: "Ben", title: [Records and methods], href: none),
  (date: d(10, 1),  kind: "due", href: "https://us.prairielearn.com/pl/course_instance/232999/assessment_instance/15006245", title: [Ch01], time: "9:30am"),
  (date: d(10, 1),  kind: "due", href: "https://us.prairielearn.com/pl/course_instance/232999/assessment_instance/15006264", title: [Ch02], time: "9:30am"),
  (date: d(10, 1),  kind: "due", href: "https://us.prairielearn.com/pl/course_instance/232999/assessment_instance/15006350", title: [Ch03], time: "9:30am"),
  (date: d(10, 1), kind: "lecture", n: 3, who: "Joe", title: [`main` and `java`], href: none),
  (date: d(10, 2), kind: "due", time: "10pm", title: [PA0], href: "assignments/pa0.html"),

  (date: d(10, 5), kind: "lecture", n: 3, who: "Ben", title: [`main` and `java`], href: none),
  (date: d(10, 9), kind: "due", title: [PA1], href: "assignments/pa1.html"),
  
  
  
)
