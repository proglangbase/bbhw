-module(bbhw).
-export([main/0, main/1]).

isBadArg(S) -> io:format("Invalid countdown ~p, try again...\n", [S]), main().
isBadNum(N) -> isBadArg(lists:flatten(io_lib:format("~p", [N]))).

main() ->
  case io:get_line("countdown: ") of
    eof        -> main();
    {error, _} -> main();
    "\n"       -> main();
    Line       -> main(string:chomp(Line))
  end.

main([]) -> main();

main(A) when is_atom(A)            -> main(atom_to_list(A));
main(F) when is_float(F)           -> isBadNum(F);
main(I) when is_integer(I), I <  0 -> isBadNum(I);
main(I) when is_integer(I), I >= 0 -> run(I);

main(L) when is_list(L) ->
  case io_lib:printable_list(L) of
    true ->
      case string:to_integer(L) of
        {I, []} -> main(I);
        _       -> isBadArg(L)
      end;
    false -> main(lists:concat(lists:join(" ", L)))
  end;

main(Unk) -> isBadArg(Unk).

run(Count) ->
  io:format("World, Hello..."),
  rundown(Count),
  io:format("Bye Bye.\n").
  
rundown(0) -> ok;
rundown(C) ->
  io:format("~B...", [C]),
  timer:sleep(1000), 
  rundown(C-1).
