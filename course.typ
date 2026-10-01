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
  // here to make it deterministic (tests do this). It is only as fresh as the
  // last build, which is why the deploy workflow also runs daily.
  //
  // offset: -8 is San Diego time (PST; during PDT the day turns over at 1am
  // instead of midnight). CI runs in UTC, and without it an evening build
  // would already be tomorrow -- Sunday night would highlight the next week.
  today: datetime.today(offset: -8)
)

#let doodle = none   // path to an image, or none

#let quick-links = (
  (label: [🏠 Course Home], href: "index.html"),
  (label: [✅ Syllabus], href: "syllabus.html"),
  (label: [📋 Assignments], href: "assignments.html"),
  (label: [🙋 Piazza], href: "https://piazza.com/class/mu7d4ro26uc7dl"),
  (label: [🗓️ Course Calendar], href: "calendar.html"),
  (label: [📥 Gradescope], href: "https://www.gradescope.com/courses/1404864"),
  (label: [🖥️ PrairieLearn], href: "https://us.prairielearn.com/pl/course_instance/232999"),
)

#let staff = (
  (name: "Ben Ochoa", role: [Instructor], href: "https://cseweb.ucsd.edu/~bochoa/", hours: [Office Hours: Wed 8:00 PM-9:00 PM (primary) and Mon 8:00 PM-9:00 PM (secondary), CSE 3234]),
  (name: "Joe Politz", role: [Instructor], href: "https://jpolitz.github.io", hours: [Office Hours: Tue 11am-12pm, Galbraith Hall 253 and Wed 9-10:00am, CSE3206]),
  (name: "Anya Bouzida", role: [TA], href: none, email: "abouzida@ucsd.edu", hours: []),
  (name: "Daniela Perry", role: [TA], href: none, email: "dsperry@ucsd.edu", hours: []),
  (name: "Gonzalo Allen-Perez", role: [TA], href: none, email: "gallenperez@ucsd.edu", hours: []),
  (name: "Neel Shitolay", role: [TA], href: none, email: "nshitolay@ucsd.edu", hours: []),
  (name: "Rachel Lim", role: [TA], href: none, email: "ral077@ucsd.edu", hours: []),
  (name: "Sydney Zhang", role: [TA], href: none, email: "syz001@ucsd.edu", hours: []),
  (name: "Amanda Tsai", role: [Tutor], href: none, email: "a7tsai@ucsd.edu", hours: []),
  (name: "Blake Newhouse", role: [Tutor], href: none, email: "blnewhouse@ucsd.edu", hours: []),
  (name: "Brendan Barber", role: [Tutor], href: none, email: "btbarber@ucsd.edu", hours: []),
  (name: "Gavin Wu", role: [Tutor], href: none, email: "gawu@ucsd.edu", hours: []),
  (name: "Kathy Charry", role: [Tutor], href: none, email: "kacharry@ucsd.edu", hours: []),
  (name: "Marta Krylova", role: [Tutor], href: none, email: "mkrylova@ucsd.edu", hours: []),
  (name: "Tianlin Situ", role: [Tutor], href: none, email: "tsitu@ucsd.edu", hours: []),
  (name: "Zach Swanson", role: [Tutor], href: none, email: "zswanson@ucsd.edu", hours: []),
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
   extras: (
     (label: [worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/definitions-and-values.pdf"),
     (label: [notes], href: "https://drive.google.com/file/d/1itvjKiYiGCoDTVxVXDfq7mp-Qk5Eq9qI/view?usp=sharing"),
   )),

  (date: d(9, 28), kind: "lecture", n: 1, who: "Ben", title: [Programs and values], href: none,
   extras: (
     (label: [worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/definitions-and-values.pdf"),
     (label: [slides], href: "https://cseweb.ucsd.edu/classes/fa26/cse11-002/lec1.pdf"),
   )
  ),
  (date: d(9, 29), kind: "lecture", n: 2, who: "Joe", title: [Records and methods], href: none,
   extras: (
     (label: [composition worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/composition-styles.pdf"),
     (label: [notes], href: "https://drive.google.com/file/d/1ZOz16PhBrfCj6O0hWGoPeYShPn69Um5K/view?usp=sharing"),
   )),
  (date: d(9, 30), kind: "lecture", n: 2, who: "Ben", title: [Records and methods], href: none,
   extras: (
     (label: [composition worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/composition-styles.pdf"),
     (label: [slides], href: "https://cseweb.ucsd.edu/classes/fa26/cse11-002/lec2.pdf"),
   )),
  (date: d(10, 1),  kind: "due", href: "https://us.prairielearn.com/pl/course_instance/232999/assessments", title: [Ch01,02,03], time: "9:30am"),
  (date: d(10, 1), kind: "lecture", n: 3, who: "Joe", title: [Designing Data], href: none,
    extras: (
      (label: [names worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/student-names.pdf"),
      (label: [notes], href: "https://drive.google.com/file/d/16eZ86aJ0-a0uxS4EdFqFsjdHP04h7aCG/view?usp=sharing"),
    )
  ),
  (date: d(10, 2), kind: "due", time: "11:59pm", title: [PA0], href: "assignments/pa0.html"),

  (date: d(10, 5), kind: "lecture", n: 3, who: "Ben", title: [Designing Data], href: none,
    extras: (
      (label: [names worksheet], href: "https://ucsd-cse11.github.io/book/fa26/worksheets/student-names.pdf"),
    ),
  ),
  (date: d(10, 9), kind: "due", title: [PA1], href: "assignments/pa1.html"),
  
  
  
)
