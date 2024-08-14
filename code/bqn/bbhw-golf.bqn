#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
c←"countdown"⋄t←•term⋄F←t.Flush⋄O←t.OutRaw
(•BQN{{{𝕩≢""?•Out"Invalid "∾c∾' '∾'"'∾𝕩∾'"'∾", try again...";@}𝕩
O c∾": "⋄(∨`⌾⌽' '⊸≠)⊸/(∨`' '⊸≠)⊸/•GetLine@
}•_while_(¬((≢⟜"")∧(⊑∘(×´)(∊⟜"0123456789")¨)))1↓∾(" "⊸∾¨•args)∾⟨""⟩})⊸{
F O"World, Hello..."⋄{F O(•Fmt𝕩+1)∾"..."⋄•Delay 1}¨⌽↕𝕨}@⋄•Out"Bye Bye."⋄•Exit 0
