-module(parser).
-export([parse/1]).
-export([map_lines/1]).

parse(File) ->
  { _, IO } = file:open(File,read),
  map_lines(get_lines([], IO)).

get_lines(Lines, IO) ->
  ReadResult = file:read_line(IO),
  case ReadResult of
    {ok, Line}  ->
      "\n" ++ Reversed = lists:reverse(Line),
      NewLine = lists:reverse(Reversed),
      get_lines(lists:append(Lines, [NewLine]), IO);
    eof         -> Lines
  end.

map_lines(Lines) ->
  element(1,lists:mapfoldl(fun(Line, Y) -> { map_line({Line, Y+1}), Y+1 }  end, 0, Lines)).

map_line({Line, Y}) ->
  element(1,lists:mapfoldl(fun(Char, X) -> { {map_char(Char), X+1, Y}, X+1 } end, 0, Line)).

map_char(32)  -> alive;
map_char(46)  -> dead;
map_char(_)   -> error.
