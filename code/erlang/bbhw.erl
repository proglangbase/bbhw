-module(bbhw).
-export([main/0, main/1]).

main()    -> main([]). % `erl -noshell -s bbhw main [countdown] -s init stop`
main([])  -> run();    % `erl bbhw.erl [countdown]`

main(Arg) when is_integer(Arg) -> 
  case isItGood(Arg) of
    true  -> run(Arg);
    false -> isBadArg(Arg)
  end;
  
main(Arg) ->
  Is_string = io_lib:printable_list(Arg),
  Is_list   = is_list(Arg),    
  Is_atom   = is_atom(Arg),    % `erl -noshell` args come in as atoms.
  
  if 
    Is_string -> 
      case getCountdown(Arg) of
        error -> main();
        C     -> run(C)
      end;
      
    Is_list -> main(hd(Arg));  % true for `Is_string`.
    Is_atom -> main(atom_to_list(Arg));
    true    -> isBadArg(Arg)
  end.
  
getCountdown(S) ->
  case string:to_integer(S) of
    {I, []} -> case isItGood(I) of 
      true -> I; 
      _    -> isNotGood(I) 
    end;
    _ -> isNotGood(S)
  end.
   
isBadArg(Arg) ->
  isNotGood(Arg),
  run().

isItGood(I) -> 
  I >= 0.

isNotGood(S) -> 
  io:format("Invalid countdown ~p, try again...\n", [S]), 
  error.
    
readInput() ->
  case io:get_line("countdown: ") of
    eof        -> readInput();
    {error, _} -> readInput();
    "\n"       -> readInput();
    Line       -> case getCountdown(string:strip(Line, right, $\n)) of
      error -> readInput();
      I     -> I
    end
  end.

run()  -> run(readInput()).    
run(C) ->
  io:format("World, Hello..."),
  rundown(C),
  io:format("Bye Bye.\n").
  
rundown(0) -> ok;
rundown(C) ->
  io:format("~B...", [C]),
  timer:sleep(1000), 
  rundown(C-1).