#
#   Copyright © 2024 Christopher Augustus
#
#   This Source Code Form is subject to the terms of the Mozilla Public
#   License, v. 2.0. If a copy of the MPL was not distributed with this
#   file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
CmdLineArg  ← 1⊸↓∾∘(" "⊸∾¨•args)∘∾⟜⟨""⟩
NotEmpty    ← ≢⟜""
TrimBlanks  ← (∨`⌾⌽' '⊸≠)⊸/(∨`' '⊸≠)⊸/
AskInput    ← TrimBlanks •GetLine∘•term.OutRaw∘⊢⟜"countdown: "
AskIfEmpty  ← NotEmpty◶⟨AskInput,⊢⟩
OnlyDigits  ← ⊑∘(×´)(∊⟜"0123456789")¨
ValidInput  ← (NotEmpty ∧ OnlyDigits)⊢
SayInvalid  ← •Out("Invalid countdown "⊸∾)∘('"'⊸∾)∘(∾⟜", try again...")∘(∾⟜'"')
AskInvalid  ← AskInput NotEmpty◶⟨⊢,SayInvalid⟩
AskWhileBad ← AskInvalid •_while_ (¬ValidInput)
GetCount    ← •BQN AskWhileBad∘AskIfEmpty∘CmdLineArg
SayHello    ← •term.Flush •term.OutRaw∘⊢⟜"World, Hello..."
SaySec      ← •term.Flush •term.OutRaw∘(∾⟜"...")∘•Fmt∘(+⟜1)
SaySecSleep ← (1 •Delay∘⊣ SaySec)
CountDown   ← SaySecSleep¨⌽∘↕∘⊢
SayByeBye   ← •Out⊢⟜"Bye Bye."

GetCount ⊸ (SayHello ⊸ CountDown⊣)@ ⋄ SayByeBye@ ⋄ •Exit 0
