#! /usr/bin/env gforth

\ Alternate buffer allocation:
\ 84 constant size
\ size buffer: buf

: ask ( -- c-addr u ) ." Count? " pad dup 84 accept cr ;

: get-count ( -- d )
  next-arg 2dup d0= if 2drop ask then
  begin 2dup s>number? 0= >r 2dup d0< r> or while
    2drop ." Invalid input " type ." . " ask
  repeat 2nip ;

: count-down ( u -- )
  ." World, Hello..."
  0 swap -do
    i s>d <# s" ..." holds #s #> type 1000 ms
  1 -loop
  ." Goodbye." cr ;

get-count d>s count-down bye
