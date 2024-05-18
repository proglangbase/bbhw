USING: calendar combinators.short-circuit.smart command-line
interpolate io kernel math math.parser namespaces ranges
sequences threads ;
IN: bbhw

: ask-n ( -- str )
  "countdown: " write flush
  readln ;

: initial-n ( -- str )
  command-line get
  [ ask-n ] [ first ] if-empty ;

: valid-n? ( str -- ? )
  string>number
  { [ ] [ integer? ] [ 0 > ] } && ;

: say-bye-bye ( n -- )
  "World, Hello..." write
  1 [a..b] [
    I"${}..." write flush
    1 seconds sleep
  ] each
  "Bye Bye." print ;

: main ( -- )
  initial-n
  [ dup valid-n? ] [
    I"Invalid countdown ${}, try again..." print
    ask-n
  ] until
  string>number say-bye-bye ;

MAIN: main
