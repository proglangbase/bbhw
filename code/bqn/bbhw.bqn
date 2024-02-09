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
        ; •Out "countdown: " ⋄ input ↩ •GetLine@
            # TODO: ^ ### SUPRESS NEWLINE
    }
    { (input≢"") ∧ (⊑×´{𝕩∊"0123456789"}¨input) ?
        count ↩ {𝕨+𝕩×10}´{𝕩-'0'}⌽input
        ; •Out "Invalid countdown "∾input∾", try again..."
          input ↩ ""
    }
}
•Out "World, Hello..."
{•Out (•Fmt 𝕩+1)∾"..." ⋄ •Delay 1}¨⌽↕count
    # TODO: ^ ### SUPRESS NEWLINE
•Out "Bye Bye."
•Exit 0
