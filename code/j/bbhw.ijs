#!/usr/bin/env j
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
)
main =: verb define
  count=:''
  input=:>2{ARGV,<''
  while. (#count) = 0 do.
    if. (#input) = 0 do.
      tmoutput 'countdown: '
      input=:1!:1[1
    end.
    if. (#count=:".input) = 0 do.
      smoutput 'Invalid countdown ',":input,', try again...'
      input=:''
    end.
  end.
  tmoutput 'World, Hello...'
  {{tmoutput (>":y),'...'
    NB. TODO: ### FLUSH NEEDED ON macOS BUT NOT ON Windows
    usleep 1000000 }} each |.1 + i.count
  smoutput 'Bye Bye.'
  exit
)
donext =: [: (9!:29) 1: [ 9!:27
donext 'main _'
