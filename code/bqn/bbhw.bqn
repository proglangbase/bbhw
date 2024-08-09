#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
clarg ← 1↓∾(" "⊸∾¨•args)∾⟨""⟩
Input ← { 𝕩≢"" ? 𝕩 ; •term.OutRaw"countdown: " ⋄ •GetLine@}
Count ← {(𝕩≢"")∧(⊑×´{𝕩∊"0123456789"}¨𝕩) ? •BQN 𝕩
          ; •Out "Invalid countdown "∾'"'∾𝕩∾'"'∾", try again..."
            𝕊(Input"")} # TODO: ### REPLACE RECURSION WITH {𝕩•_while_{𝕩=¯1}}
c ← Count Input clarg
•term.OutRaw "World, Hello..." ⋄ •term.Flush@
{•term.OutRaw (•Fmt 𝕩+1)∾"..." ⋄ •term.Flush@ ⋄ •Delay 1}¨⌽↕c
•Out "Bye Bye."
•Exit 0
