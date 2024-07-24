: quote '"' emit ;      \ since we don't have .\"
: 2nip 2swap 2drop ;

: ask ( -- c-addr u ) ." countdown: " pad dup 84 accept cr ;

: get-count ( -- d )
  begin #0. 2over dup if >number nip else 2drop 1 then while
    2drop ." Invalid input " quote type quote ." , try again..." cr ask
  repeat 2nip ;

: count-down ( u -- )
  ." World, Hello..."
  dup if
  1 swap do
    i s>d <# #s #> type ." ..." 1000 ms
  -1 +loop
  then
  ." Bye Bye." cr ;

( If you load this with "include bbhw.fs" in pforth,
  this word is left defined so you can "bbhw 2" later )
: bbhw  \ interactive word, accepts argument
  cr bl word count
  dup 0= if 2drop ask then
  get-count d>s count-down ;

\ This version gets run on load and doesn't accept an argument
ask get-count d>s count-down

