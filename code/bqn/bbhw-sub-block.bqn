#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
CmdLineArg  ← {𝕊: 1↓∾(" "⊸∾¨•args)∾⟨""⟩}
NotEmpty    ← {𝕩≢""}
TrimBlanks  ← {(∨`⌾⌽' '⊸≠)⊸/(∨`' '⊸≠)⊸/𝕩}
AskInput    ← {𝕊: •term.OutRaw"countdown: " ⋄ TrimBlanks •GetLine@}
AskIfEmpty  ← {NotEmpty 𝕩 ? 𝕩 ; AskInput@}
OnlyDigits  ← {⊑×´{𝕩∊"0123456789"}¨𝕩}
ValidInput  ← {(NotEmpty ∧ OnlyDigits) 𝕩}
SayInvalid  ← {•Out "Invalid countdown "∾'"'∾𝕩∾'"'∾", try again..."}
AskInvalid  ← {{NotEmpty 𝕩 ? SayInvalid 𝕩 ;@} 𝕩 ⋄ AskInput@}
AskWhileBad ← {AskInvalid •_while_ (¬ValidInput) 𝕩}
GetCount    ← {•BQN AskWhileBad AskIfEmpty CmdLineArg 𝕩}
SayHello    ← {𝕊: •term.OutRaw "World, Hello..." ⋄ •term.Flush@}
SaySec      ← {   •term.OutRaw (•Fmt 𝕩+1)∾"..."  ⋄ •term.Flush@}
SaySecSleep ← {SaySec 𝕩 ⋄ •Delay 1}
CountDown   ← {SaySecSleep¨⌽↕𝕩}
SayByeBye   ← {𝕊: •Out "Bye Bye."}

GetCount ⊸ {SayHello ⊸ CountDown 𝕨}@ ⋄ SayByeBye@ ⋄ •Exit 0
