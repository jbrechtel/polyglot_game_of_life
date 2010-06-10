-module(printer).
-export([print_world/1]).

print_world(World) ->
  lists:foreach(fun(Row) -> print_row(Row) end, World).

print_row(Row) ->
  lists:foreach(fun(Cell) -> print_cell(Cell) end, Row),
  io:format("\n",[]).

print_cell({alive, _, _}) ->
  io:format("#",[]);

print_cell({dead, _, _}) ->
  io:format("-", []).
