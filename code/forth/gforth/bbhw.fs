#! /usr/bin/env gforth

\ Alternate buffer allocation:
\ 84 constant size
\ size buffer: buf

: ask ( -- c-addr u ) ." countdown: " pad dup 84 accept cr ;

: get-count ( -- d )
  next-arg 2dup d0= if 2drop ask then
  begin #0. 2over >number nip while
    2drop ." Invalid input " type ." , try again..." cr ask
  repeat 2nip ;

: count-down ( u -- )
  ." World, Hello..."
  0 swap -do
    i s>d <# s" ..." holds #s #> type 1000 ms
  1 -loop
  ." Bye Bye." cr ;

get-count d>s count-down bye
