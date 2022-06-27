-module(diedie_ffi).
-export([exit/2]).

exit(Code, MaybeMessage) when is_integer(Code) ->
    case {Code, MaybeMessage} of
        {0, {some, Message}} ->
            io:format("Quit: ~p~n", [Message]);
        {Code@1, {some, Message}} when Code@1 =/= 0 ->
            io:format("Abort (~p): ~p~n", [Code@1, Message]);
        {Code@1, none} when Code@1 =/= 0 ->
            io:format("Abort (~p)~n", [Code@1]);
        _ -> nil
    end,
    erlang:halt(Code).
