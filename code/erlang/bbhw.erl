-module(bbhw).
-export([main/0, main/1]).

isBadArg(S) -> io:format("Invalid countdown ~p, try again...\n", [S]).
isBadNum(N) -> isBadArg(lists:flatten(io_lib:format("~p", [N]))).

main() ->
  case io:get_line("countdown: ") of
    eof        -> main();
    {error, _} -> main();
    "\n"       -> main();
    Line       -> main(string:strip(Line, right, $\n))
  end.

main(A) when is_atom(A)  -> main(atom_to_list(A));
main(F) when is_float(F) -> isBadNum(F), main();

main(L) when is_list(L) ->
  case io_lib:printable_list(L) of
    true  -> 
      case string:len(L) > 0 of
        true  -> 
          case string:to_integer(L) of
            {I, []} -> main(I);
            _       -> isBadArg(L), main()
          end;
        false -> main()
      end;
    false -> main(hd(L))
  end;

main(I) when is_integer(I) ->  
  case I >= 0 of
    true  -> run(I);
    false -> isBadNum(I), main()
  end.

run(Count) ->
  io:format("World, Hello..."),
  rundown(Count),
  io:format("Bye Bye.\n").
  
rundown(0) -> ok;
rundown(C) ->
  io:format("~B...", [C]),
  timer:sleep(1000), 
  rundown(C-1).
