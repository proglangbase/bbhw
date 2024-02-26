⍝
⍝   Copyright © 2024 Christopher Augustus
⍝
⍝   This Source Code Form is subject to the terms of the Mozilla Public
⍝   License, v. 2.0. If a copy of the MPL was not distributed with this
⍝   file, You can obtain one at http://mozilla.org/MPL/2.0/.
⍝
∇Z←GetCount ;C
    C←,⊃{1↑(⌊/(({⍵≡'--'}¨⍵)⍳1),≢⍵)↓⍵,¯1}⊢⎕ARG
    →(↑C≠⊂¯1)⍴Lcheck
Linput:
    ⍞←'countdown: ' ◊ C←{⍵/⍨∨\⍵≠' '}⍞ ◊ '' ⍝ TODO: ### ECHO INPUT
Lcheck:
    →(×/{⍵∈'0123456789'}C)⍴Lvalid
    'Invalid countdown ',C,', try again...'
    →Linput
Lvalid:
    Z←⍎C
∇
COUNT←GetCount
⍞← 'World, Hello...'
⊣ {⊣ D←⎕DL 1 ⊣ ⍞←(⍕⍵),'...'}¨⌽⍳COUNT
⍞←'Bye Bye.'
)OFF
