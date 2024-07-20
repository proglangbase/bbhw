-module(bbhw).
-export([main/0, main/1]).

main() ->
  case io:get_line("countdown: ") of
    eof        -> main();
    {error, _} -> main();
    "\n"       -> main();
    Line       -> main([string:chomp(Line)])
  end.

main([]) -> main();

main(Atom)  when is_atom(Atom)                 -> sayInvalidAsString(Atom);
main(Float) when is_float(Float)               -> sayInvalidAsString(Float);
main(Count) when is_integer(Count), Count <  0 -> sayInvalidAsString(Count);
main(Count) when is_integer(Count), Count >= 0 -> run(Count);

main(List) when is_list(List) ->
  Input = case io_lib:printable_list(List) of
    true -> List;
    _    -> lists:concat(lists:join(" ", List))
  end,
  case string:to_integer(Input) of
    {Count,[]} -> main(Count);
    {_    ,_ } -> sayInvalid([Input])
  end;

main(Unknown) -> sayInvalid([Unknown]).

sayInvalid(String) ->
  io:format("Invalid countdown ~p, try again...\n", String),
  main().

sayInvalidAsString(X) ->
  sayInvalid(io_lib:format("~p", [X])).

run(Count) ->
  io:format("World, Hello..."),
  rundown(Count),
  io:format("Bye Bye.\n").

rundown(0) -> ok;
rundown(C) ->
  io:format("~B...", [C]),
  timer:sleep(1000),
  rundown(C-1).
