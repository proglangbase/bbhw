#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
({•BQN (((∨`⌾⌽' '⊸≠)⊸/(∨`' '⊸≠)⊸/)∘•GetLine∘(•term.OutRaw∘⊢⟜"countdown: ")∘({
  (≢⟜"")◶⟨⊢,•Out("Invalid countdown "⊸∾)∘('"'⊸∾)∘(∾⟜", try again...")∘(∾⟜'"')⟩
  })) •_while_ (¬((≢⟜"")∧(⊑∘(×´)(∊⟜"0123456789")¨))) 1↓∾(" "⊸∾¨•args)∾⟨""⟩
})⊸((•term.Flush •term.OutRaw∘⊢⟜"World, Hello...")⊸({
   ((1 •Delay∘⊣ (•term.Flush •term.OutRaw∘(∾⟜"...")∘•Fmt∘(+⟜1)))¨⌽∘↕∘⊢)
})⊣)@ ⋄ •Out "Bye Bye." ⋄ •Exit 0
