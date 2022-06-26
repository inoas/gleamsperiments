-module(diedie_ffi).

-export([exit/2]).

exit(Code, {some, Message}) ->
	io:format("Exit message: ~p~n", [Message]),
	io:format("Exit status code: ~p~n", [Code]),
	erlang:exit(self(), Code);
exit(Code, none) ->
	io:format("Exit status code: ~p~n", [Code]),
	erlang:exit(self(), Code)
.
