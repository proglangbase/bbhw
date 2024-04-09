#!/usr/bin/env j
Note''
    Copyright © 2024 Christopher Augustus

    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
)
main=:3 :0
  0 0$1!:2&2'Bye Bye.'[{{{{
    usleep 1000000[1!:2&4(>":y),'...'
      NB. TODO: ^ ### FLUSH NEEDED ON macOS BUT NOT ON Windows
      NB. note usleep breaks loop if within train instead of dd
  }}&.>|.1+i.y[1!:2&4'World, Hello...'}}>{:{{
    (<1+>{.y),(<''),<{{
      ((y&{{''[1!:2&2'Invalid countdown ',":x,', try again...'}})^:(0=#))".y
    }}{{".(>(0&=#y){('';'1!:1(1)[1!:2&4''countdown: ''[')),'''',y,''''}}>1{y
  }}^:((0=#)@:>@:{:)^:_(<0),(2{ARGV,<''),<''
)
9!:29(1)[9!:27'main _'
NB. ^ help from tangentstorm and
NB. https://code.jsoftware.com/wiki/Vocabulary/Foreigns#m9
