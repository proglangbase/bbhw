#!/usr/bin/env j
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
)
main=:3 :0
  count=:''                                                     NB. global var
  input=:>2{ARGV,<''                                            NB. global var
  while.0=#count do.
    {{input=:1!:1[1[1!:2&4'countdown: '}}^:(0&=)#input          NB. global mutation!
    {{input=:''[1!:2&2'Invalid countdown ',":y,', try again...' NB. global mutation!
      }}^:{{0=(#count=:".y)}}input                              NB. global mutation!
  end.
  1!:2&4'World, Hello...'
  {{usleep 1000000[1!:2&4(>":y),'...'}}each|.1+i.count
    NB. TODO: ^ ### FLUSH NEEDED ON macOS BUT NOT ON Windows
  0 0$1!:2&2'Bye Bye.'
)
9!:29(1)[9!:27'main _'
NB. ^ help from tangentstorm and
NB. https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9
