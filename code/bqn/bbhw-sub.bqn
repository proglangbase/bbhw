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
AskCount    ← {𝕊: •term.OutRaw"countdown: " ⋄ •GetLine@}
ValidCount  ← {(𝕩≢"")∧(⊑×´{𝕩∊"0123456789"}¨𝕩)}
SayInvalid  ← {•Out "Invalid countdown "∾'"'∾𝕩∾'"'∾", try again..."}
CountOrAsk  ← {ValidCount 𝕩 ? •BQN 𝕩 ; SayInvalid 𝕩 ⋄ 𝕊 AskCount@}
                # ^ TODO: ### REPLACE RECURSION WITH {𝕩•_while_{𝕩=¯1}}
AskIfEmpty  ← {𝕩≢"" ? 𝕩 ; AskCount@}
GetCount    ← {𝕊: CmdLineArg ⊸ (AskIfEmpty ⊸ CountOrAsk˜) @}
SayHello    ← {𝕊: •term.OutRaw "World, Hello..." ⋄ •term.Flush@}
SaySec      ← {   •term.OutRaw (•Fmt 𝕩+1)∾"..."  ⋄ •term.Flush@}
SaySecSleep ← {SaySec 𝕩 ⋄ •Delay 1}
CountDown   ← {SaySecSleep¨⌽↕𝕩}
SayByeBye   ← {𝕊: •Out "Bye Bye."}

GetCount ⊸ {SayHello ⊸ CountDown 𝕨}@ ⋄ SayByeBye@ ⋄ •Exit 0
