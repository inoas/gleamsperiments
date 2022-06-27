-module(diedie_ffi).

-export([exit/2]).

exit(Code, MaybeMessage) when is_integer(Code) ->
    case {Code, MaybeMessage} of
        {0, {some, Message}} ->
            io:format("Quit: ~p~n", [Message]);
        {Code, {some, Message}} ->
            io:format("Abort (~p): ~p~n", [Code, Message]);
        {Code, none} ->
            io:format("Abort (~p)~n", [Code])
    end,
    erlang:halt(Code).
