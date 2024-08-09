#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
count ← ¯1
input ← ⊑•args∾⟨""⟩
{𝕩•_while_𝕨@}´ {𝕤⋄count=¯1}‿{𝕤
    { input≢"" ? @
        ; •term.OutRaw "countdown: " ⋄ input ↩ •GetLine@
    }
    { (input≢"") ∧ (⊑×´{𝕩∊"0123456789"}¨input) ?
        count ↩ •BQN input
        ; •Out "Invalid countdown "∾input∾", try again..."
          input ↩ ""
    }
}
•term.OutRaw "World, Hello..." ⋄ •term.Flush@
{•term.OutRaw (•Fmt 𝕩+1)∾"..." ⋄ •term.Flush@ ⋄ •Delay 1}¨⌽↕count
•Out "Bye Bye."
•Exit 0
