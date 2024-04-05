#!/usr/bin/env jconsole
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
)
main =: 3 : 0
  input =. >2{ARGV,a:
  badnum =: ([:((_=]) +. (0>]) +. (~:<.))(1$])) +. (1~:#)
  whilst. badnum count do.
    count =. _ ". input =. {{ 1!:1(1) [ 1!:2&4 'countdown: ' NB. local mutation!
      }} ^: (0=#) input
    input {{ 1!:2&2 'Invalid countdown ',x,', try again...'
      }} ^: ([:badnum]) count
    input =. '' NB. local mutation!
  end.
  1!:2&4 'World, Hello...'
  {{ usleep 1000000 [ 1!:2&4 (":y),'...' }} &.> (- i.)count
    NB. TODO: ^ ### FLUSH NEEDED ON macOS BUT NOT ON Windows
    NB. note usleep breaks loop if within train instead of dd
  'Bye Bye.'
)
9!:29(1) [ 9!:27 'main _'
NB. ^ help from tangentstorm and
NB. https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9
