-module(bbhw).
-export([main/0, main/1]).

badArg(S) -> io:format("Invalid countdown ~p, try again...\n", [S]), main().
badNum(N) -> badArg(lists:flatten(io_lib:format("~p", [N]))).

main() ->
  case io:get_line("countdown: ") of
    eof        -> main();
    {error, _} -> main();
    Line       -> main(string:chomp(Line))
  end.

main([]) -> main();

main(F) when is_float(F)          -> badNum(F);
main(I) when is_integer(I), I < 0 -> badNum(I);
main(A) when is_atom(A)           -> main(atom_to_list(A));

main(L) when is_list(L) ->
  case io_lib:printable_list(L) of
    true ->
      case string:to_integer(L) of
        {I, []} -> main(I);
        _       -> badArg(L)
      end;
    false -> main(lists:concat(lists:join(" ", L)))
  end;

main(Count) when is_integer(Count), Count >= 0 -> 
  Loop = fun Loop(0) -> ok; Loop(I) ->
    io:format("~B...", [I]),
    timer:sleep(1000), 
    Loop(I-1)
  end,
  io:format("World, Hello..."),
  Loop(Count),
  io:format("Bye Bye.\n");

main(Unk) -> badArg(Unk).
