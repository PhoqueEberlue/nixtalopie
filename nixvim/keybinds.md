# Keybinds

My neovim keybinds are fully remapped because I am using the dvorak keyboard layout.
I did not perform remapping based on "physical location", i.e. in dvorak `i` becomes `g`,
so I could just have swapped their binds so that `g` lets me enter insert mode.

Instead I totally rearranged vim keybindings to something to feels more ergonomic in the sense that common binds
are now placed close together: previous/end work, start/end line, open/insert/insert after/substitue.
Yet it is less intuitive because the letters won't give any clue about what they do (`i` for Insert, `v` for Visual etc.).

So globally I tried to place every commands on the left, and every motion on the right 
(with exception to visual mode that feels __right__ to be next to motions binds).

 ┌────────┬────────┬────────┬────────┬────────┐ ┌────────┬────────┬────────┬────────┬────────┐
 │TODO    │Access  │Repeat  │undo    │replace │ │Find    │TODO    │previous│end word│TODO    │
 │        │Reg     │cmd     │        │        │ │char    │        │word    │        │        │
 ├────────┼────────┼────────┼────────┼────────┤ ├────────┼────────┼────────┼────────┼────────┤
 │delete  │open be-│insert  │append  │delete  │ │Random  │left    │down    │up      │right   │
 │char    │low     │        │        │        │ │char    │        │        │        │        │
 ├────────┼────────┼────────┼────────┼────────┤ ├────────┼────────┼────────┼────────┼────────┤
 │exec cmd│substit-│yank    │paste   │replace │ │Venn    │Start-of│Goto    │Visual  │End-of- │
 │+ visual│ute     │        │        │mode    │ │mode    │-line   │match   │mode    │line    │
 └┬───────┴────────┴────────┴────────┴────────┘ └┬───────┴────────┴────────┴────────┴────────┘
  │                                              └──► With plugin Venn.nvim, draw some cool ascii diagrams (just like this one)
  └──► Same than exec cmd + in visual mode, instead of prefilling with `:'<,'>` 
       we get `:%s/\%V` which lets us replace strictly the selection only 

When Shifted:
 ┌────────┬────────┬────────┬────────┬────────┐ ┌────────┬────────┬────────┬────────┬────────┐
 │        │unindent│indent  │redo    │        │ │        │        │        │        │        │
 │        │        │        │        │        │ │        │        │        │        │        │
 ├────────┼────────┼────────┼────────┼────────┤ ├────────┼────────┼────────┼────────┼────────┤
 │        │        │        │        │        │ │Put ran-│        │down    │up      │        │
 │        │        │        │        │        │ │dom char│        │file    │file    │        │
 ├────────┼────────┼────────┼────────┼────────┤ ├────────┼────────┼────────┼────────┼────────┤
 │exec cmd│        │        │        │        │ │        │        │        │Visual  │        │
 │        │        │        │        │        │ │        │        │        │block   │        │
 └────────┴────────┴────────┴────────┴────────┘ └────────┴────────┴────────┴────────┴────────┘
  


 
