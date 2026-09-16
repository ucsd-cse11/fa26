// ===========================================================================
// The site's authoring vocabulary. All markup is emitted here; course.typ
// stays pure data and site.typ stays a list of pages. Mirrors the split
// that lib/book.typ makes in the book repo.
// ===========================================================================

#let _kind-label = (
  lecture: "Lecture", lab: "Lab", disc: "Discussion", due: "Due",
  exam: "Exam", reading: "Reading", holiday: "Holiday",
)

#let lozenge(kind, body) = html.elem("strong", attrs: (class: "lz lz-" + kind), body)

// Like #link, but opens in a new tab. Typst's link() has no target: param,
// so this drops to a raw anchor. Explicit at the call site rather than a
// show rule over every http:// destination, so "leaves the site" stays a
// decision. Styled identically to an ordinary link for now.
#let link-out(dest, body) = {
  assert(type(dest) == str,
    message: "link-out: expects a URL string; use link() for in-site labels")
  html.elem("a", attrs: (href: dest, target: "_blank", rel: "noopener noreferrer"), body)
}

// Pages below the top level (pa/01.html, lectures/01.html) need in-site hrefs
// written relative to *them*, not to the site root. `base` is the way back up
// ("../" one level down) and every page passes its own; the default "" is the
// top level, where nothing changes.
//
// Only raw strings need this. #link(<label>) is resolved by typst's bundle
// export, which already knows where both ends live, so labels are left alone —
// as are absolute URLs, scheme-relative ones, root-relative paths and bare
// fragments. mailto: and tel: count as absolute, which is why this matches a
// scheme rather than looking for "://".
#let _absolute = regex("^([a-zA-Z][a-zA-Z0-9+.\-]*:|//|/|#)")
#let _rebase(base, href) = {
  if base == "" or type(href) != str { href }
  else if href.match(_absolute) != none { href }
  else { base + href }
}

#let week-of(date, start) = calc.floor((date - start).days() / 7) + 1

#let _fmt-day(date) = date.display("[weekday repr:short], [month repr:short] [day padding:none]")

// One schedule entry: lozenge, linked title, trailing small links, an
// optional one-line note, an optional reading pointer.
#let entry(s) = {
  let name = _kind-label.at(s.kind, default: "Item")
  let tag = if "n" in s { name + " " + str(s.n) } else { name }
  html.elem("div", attrs: (class: "entry"))[
    #lozenge(s.kind, tag)
    #if s.at("href", default: none) != none [#link(s.href, s.title)] else [#s.title]
    #for e in s.at("extras", default: ()) [
      #html.elem("a", attrs: (class: "xtra", href: e.href), e.label)
    ]
    #if s.at("reading", default: none) != none {
      html.elem("span", attrs: (class: "reading"), s.reading)
    }
    #if s.at("note", default: none) != none {
      html.elem("div", attrs: (class: "note"), s.note)
    }
  ]
}

// A week: heading, then one row per date. Main lane left, due lane right.
#let week-block(w, items, current: false) = {
  let dates = items.map(s => s.date).dedup().sorted(key: d => d.ordinal())
  let cls = if current { "week current" } else { "week" }
  html.elem("section", attrs: (class: cls, id: "week-" + str(w)))[
    #html.elem("h2", attrs: (class: "week-label"))[
      #link("#week-" + str(w), "Week " + str(w))
    ]
    #html.elem("div", attrs: (class: "rows"))[
      #for dt in dates {
        let same = items.filter(s => s.date == dt)
        let main = same.filter(s => s.kind != "due")
        let due = same.filter(s => s.kind == "due")
        html.elem("div", attrs: (class: "row"))[
          #html.elem("div", attrs: (class: "when"), _fmt-day(dt))
          #html.elem("div", attrs: (class: "what"))[#for s in main [#entry(s)]]
          #html.elem("div", attrs: (class: "due"))[#for s in due [#entry(s)]]
        ]
      }
    ]
  ]
}

#let calendar(term, sessions) = {
  let ws = sessions.map(s => week-of(s.date, term.start)).dedup().sorted()
  if term.weeks-descending { ws = ws.rev() }
  html.elem("div", attrs: (class: "calendar"))[
    #let now = week-of(term.today, term.start)
    #for w in ws {
      week-block(w, sessions.filter(s => week-of(s.date, term.start) == w), current: w == now)
    }
  ]
}

// ------------------------------------------------------------------ left rail

#let _rail-section(title, body) = html.elem("section", attrs: (class: "rail-sec"))[
  #html.elem("h3", title)
  #body
]

#let rail(term, doodle, quick-links, staff, base: "") = {
  html.elem("aside", attrs: (class: "rail"))[
    #html.elem("div", attrs: (class: "brand"))[
      #html.elem("div", attrs: (class: "course"), term.course)
      #html.elem("div", attrs: (class: "term"), term.name)
      #html.elem("div", attrs: (class: "coursetitle"), term.title)
    ]
    #if doodle != none {
      html.elem("div", attrs: (class: "doodle"), image(doodle))
    }
    #_rail-section("Go to")[
      #html.elem("ul", attrs: (class: "links"))[
        #for l in quick-links [
          #html.elem("li")[
            #link(_rebase(base, l.href), l.label)
            #if l.at("note", default: none) != none {
              html.elem("span", attrs: (class: "sub"), l.note)
            }
          ]
        ]
      ]
    ]
    #_rail-section("Staff")[
      #html.elem("ul", attrs: (class: "staff", id: "staff"))[
        #for p in staff [
          #html.elem("li")[
            #if p.href != none [#link(_rebase(base, p.href), p.name)] else [#p.name]
            #html.elem("span", attrs: (class: "sub"), p.role)
            #html.elem("span", attrs: (class: "hours"), p.hours)
          ]
        ]
      ]
    ]
  ]
}

// --------------------------------------------------------------------- shell

#let shell(left, right, base: "") = {
  html.elem("link", attrs: (rel: "stylesheet", href: _rebase(base, "assets/site.css")))
  html.elem("div", attrs: (class: "page"))[#left #right]
}
