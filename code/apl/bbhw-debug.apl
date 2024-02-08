⍝
⍝   Copyright © 2024 Christopher Augustus
⍝
⍝   This Source Code Form is subject to the terms of the Mozilla Public
⍝   License, v. 2.0. If a copy of the MPL was not distributed with this
⍝   file, You can obtain one at http://mozilla.org/MPL/2.0/.
⍝
⍝ show all ⎕CR functions in GNU APL
⍝⎕CR ⍬
∇Describe X
    '≡',1↓X,≡↑X
    '⍴',1↓X,⍴↑X
    8 ⎕CR ↑X
∇
∇Z←GetCount ;C;I
    C←,⊃{1↑(⌊/(({⍵≡'--'}¨⍵)⍳1),≢⍵)↓⍵,¯1}⊢⎕ARG
    Describe C 'C'
    I←↑C≠⊂¯1
    Describe I 'I'
    →I⍴Lcheck
Linput:
    ⍞←'countdown: ' ◊ C←{⍵/⍨∨\⍵≠' '}⍞ ◊ '' ⍝ TODO: ### ECHO INPUT
    Describe C 'C'
Lcheck:
    →(×/{⍵∈'0123456789'}C)⍴Lvalid
    'Invalid countdown ',C,', try again...'
    →Linput
Lvalid:
    Z←{⍺+⍵×10}/{(⎕UCS ⍵)-(⎕UCS '0')}⌽C
∇
COUNT←GetCount
⍞← 'World, Hello...'
⍝ GNU APL does not allow multiple statements within {}
⍝⊣ {⍞←⍵'...' ◊ D←⎕DL 1}¨⌽⍳Count
⊣ {⊣ D←⎕DL 1 ⊣ ⍞←(⍕⍵),'...'}¨⌽⍳COUNT
⍞←'Bye Bye.'
)OFF

⍝╔════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════════════╗
⍝║ ~  ║ !⌶ ║ @⍫ ║ #⍒ ║ $⍋ ║ %⌽ ║ ^⍉ ║ &⊖ ║ *⍟ ║ (⍱ ║ )⍲ ║ _! ║ +⌹ ║            ║
⍝║ `◊ ║ 1¨ ║ 2¯ ║ 3< ║ 4≤ ║ 5= ║ 6≥ ║ 7> ║ 8≠ ║ 9∨ ║ 0∧ ║ -× ║ =÷ ║ BACKSP     ║
⍝╠════╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═╩══╦═════════╣
⍝║       ║ Q  ║ W⍹ ║ E⍷ ║ R  ║ T⍨ ║ Y¥ ║ U€ ║ I⍸ ║ O⍥ ║ P⍣ ║ {⍞ ║ }⍬ ║         ║
⍝║  TAB  ║ q? ║ w⍵ ║ e∈ ║ r⍴ ║ t∼ ║ y↑ ║ u↓ ║ i⍳ ║ o○ ║ p⋆ ║ [← ║ ]→ ║ RETURN  ║
⍝╠═══════╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╦══╩═╗       ║
⍝║ (CAPS   ║ A⍶ ║ S  ║ D  ║ F  ║ G  ║ H  ║ J⍤ ║ K⌸ ║ L⌷ ║ :≡ ║ "≢ ║ |⊣ ║       ║
⍝║  LOCK)  ║ a⍺ ║ s⌈ ║ d⌊ ║ f_ ║ g∇ ║ h∆ ║ j∘ ║ k' ║ l⎕ ║ ;⍎ ║ '⍕ ║ \⊢ ║       ║
⍝╠════════╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩═══╦╩════╩═══════╣
⍝║        ║ < ¦║ Z  ║ Xχ ║ C¢ ║ V  ║ B£ ║ N  ║ M  ║ <⍪ ║ >⍙ ║ ?⍠ ║             ║
⍝║  SHIFT ║ > °║ z⊂ ║ x⊃ ║ c∩ ║ v∪ ║ b⊥ ║ n⊤ ║ m| ║ ,⍝ ║ .⍀ ║ /⌿ ║  SHIFT      ║
⍝╚════════╩════╩════╩════╩════╩════╩════╩════╩════╩════╩════╩════╩═════════════╝
