#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
#   ˜˘¨⁼⌜´˝7∞¯•÷×   ¬⎉⚇⍟◶⊘⎊⍎⍕⟨⟩√⋆   ⌽𝕨∊↑∧y⊔⊏⊐π←→    ↙𝕎⍷𝕣⍋YU⊑⊒⍳⊣⊢
#   ⍉𝕤↕𝕗𝕘⊸∘○⟜⋄↩\    ↖𝕊D𝔽𝔾«J⌾»·˙|    ⥊𝕩↓∨⌊n≡∾≍≠      ⋈𝕏C⍒⌈N≢≤≥⇐
#
count ← •BQN {
  { {𝕩≢""? •Out "Invalid countdown "∾'"'∾𝕩∾'"'∾", try again...";@} 𝕩
    •term.OutRaw "countdown: " ⋄ (∨`⌾⌽' '⊸≠)⊸/(∨`' '⊸≠)⊸/•GetLine@
  } •_while_ (¬((≢⟜"")∧(⊑∘(×´)(∊⟜"0123456789")¨))) 1↓∾(" "⊸∾¨•args)∾⟨""⟩
}
•term.OutRaw "World, Hello..." ⋄ •term.Flush@
{•term.OutRaw (•Fmt 𝕩+1)∾"..." ⋄ •term.Flush@ ⋄ •Delay 1}¨⌽↕count
•Out "Bye Bye."
•Exit 0
