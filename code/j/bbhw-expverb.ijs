#!/usr/bin/env j
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
)
main =: verb define
  count =. acquire_count >2{ARGV,<''
  tmoutput 'World, Hello...'
  output_second each |. 1 + i. count
  smoutput 'Bye Bye.'
  exit
)
acquire_count =: monad define
  co =. ''
  in =. y
  while. 0 = #co do.
    if. 0 = #in do.
      in =. ask_for_count _     NB. local mutation!
    end.
    co =. count_from_string in  NB. local mutation!
    in =. ''                    NB. local mutation!
  end.
  co
)
ask_for_count =: verb define
  tmoutput 'countdown: '
  1!:1 [ 1
)
count_from_string =: monad define
  if. 0 = # count =. ". y do.
    smoutput 'Invalid countdown ',":y,', try again...'
    ''
  else.
    count
  end.
)
output_second =: monad define
  tmoutput (>":y),'...'
  NB. TODO: ### FLUSH NEEDED ON macOS BUT NOT ON Windows
  usleep 1000000
)
donext =: [: (9!:29) 1: [ 9!:27
donext 'main _'
NB. ^ help from tangentstorm
