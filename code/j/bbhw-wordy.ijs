#!/usr/bin/env jconsole
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
)
main =: verb define
  count =. ''
  input =. > 2 { ARGV , a:
  while. 0 = # count do.
    if. 0 = # input do.
      tmoutput 'countdown: '
      input =. 1 !: 1 [ 1             NB. local mutation!
    end.
    if. 0 = # count =. ". input do.   NB. local mutation!
      smoutput 'Invalid countdown ' , input , ', try again...'
      input =. ''                     NB. local mutation!
    end.
  end.
  tmoutput 'World, Hello...'
  for_i. (- i.) count do.
    tmoutput (": i) , '...'
    NB. TODO: ### FLUSH NEEDED ON macOS BUT NOT ON Windows
    usleep 1000000
  end.
  smoutput 'Bye Bye.'
  exit
)
donext =: [: (9 !: 29) 1 [ 9 !: 27
donext 'main _'
NB. ^ help from tangentstorm
