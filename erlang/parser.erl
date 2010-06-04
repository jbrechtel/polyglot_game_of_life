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

map_lines([]) -> [];
map_lines([Head | Tail]) ->
  [map_line(Head) | map_lines(Tail)].

map_line([]) -> [];
map_line([Head | Tail]) ->
  [map_char(Head) | map_line(Tail)].

map_char(32)  -> alive;
map_char(46)  -> dead;
map_char(_)   -> error.
