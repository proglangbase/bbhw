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
CmdLineArg  ← {𝕊: 1↓∾(" "⊸∾¨•args)∾⟨""⟩}
AskInput    ← {𝕊: •GetLine •term.OutRaw"countdown: "}
AskIfEmpty  ← {𝕩≢"" ? 𝕩 ; AskInput@}
ValidInput  ← {(𝕩≢"")∧(⊑×´{𝕩∊"0123456789"}¨𝕩)}
SayInvalid  ← {•Out "Invalid countdown "∾'"'∾𝕩∾'"'∾", try again..."}
AskInvalid  ← AskInput SayInvalid
AskWhileBad ← AskInvalid •_while_ (¬ValidInput)
GetCount    ← •BQN∘AskWhileBad∘AskIfEmpty∘CmdLineArg
SayHello    ← {𝕊: •term.Flush •term.OutRaw "World, Hello..."}
SaySec      ← {   •term.Flush •term.OutRaw (•Fmt 𝕩+1)∾"..." }
SaySecSleep ← (1 •Delay∘⊣ SaySec)
CountDown   ← SaySecSleep¨⌽∘↕∘⊢
SayByeBye   ← •Out∘⊢⟜"Bye Bye."

GetCount⊸(SayHello⊸CountDown⊣)@ ⋄ SayByeBye@ ⋄ •Exit 0
