#let assignments-page = [
  = Assignments

  #html.elem("table", attrs: (class: "assign-table"))[
    #html.elem("thead")[
      #html.elem("tr")[
        #html.elem("th", [Assignment Number])
        #html.elem("th", [Initial Deadline])
        #html.elem("th", [Resubmission Deadline])
      ]
    ]
    #html.elem("tbody")[
      // PA0
      #html.elem("tr")[
        #html.elem("td")[
          #html.elem("a", attrs: (href: "assignments/pa0.html"), [PA 0])
        ]
        #html.elem("td", [October 2nd, 11:59 PM])
        #html.elem("td", [No Resubmission])
      ]

      // PA1
      #html.elem("tr")[
        #html.elem("td")[
          #html.elem("a", attrs: (href: "assignments/pa1.html"), [PA 1])
        ]
        #html.elem("td", [October 9th, 11:59 PM])
        #html.elem("td", [October 30th, 11:59 PM])
      ]

      // PA2
      #html.elem("tr")[
        #html.elem("td")[
          #html.elem("a", attrs: (href: "assignments/pa2.html"), [PA 2])
        ]
        #html.elem("td", [October 23rd, 11:59 PM])
        #html.elem("td", [])
      ]
    ]
  ]
]
