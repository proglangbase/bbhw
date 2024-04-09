#!/usr/bin/env jconsole
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.

    Special thanks to Adám Brudzedsky, tangentstorm, and twobular
    for their fixes and improvements.
)
main =: 3 : 0
  input =. >{.2}.y
  isnum =: 0&<: *. <&_ *. (=<.) *. 1=#
  whilst. -. isnum count do.
    count =. _ ". input =. (1!:1@1 [ 1!:2&4@'countdown: ')^:(0=#) input NB. local mutation!
    1!:2&2 ^:(-. isnum count) 'Invalid countdown ',input,', try again...'
    input =. '' NB. local mutation!
  end.
  1!:2&4 'World, Hello...'
  ([:usleep 1e6 [ [:1!:2&4 '...',~ ":) &.> (- i.)count
    NB. TODO: ^ ### FLUSH NEEDED ON macOS BUT NOT ON Windows
  'Bye Bye.'
)
9!:29(1) [ 9!:27 'main ARGV'
