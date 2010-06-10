-module(life).
-export([evolve/1]).
-export([evolve/2]).

evolve(Times,OriginalWorld) ->
  lists:foldl(fun(_, World) -> evolve(World) end,OriginalWorld,lists:seq(0,Times)).

evolve(World) ->
  lists:map(fun(Row) -> map_cells({Row, World}) end, World).

map_cells({Row, World}) ->
  lists:map(fun(Cell) -> map_cell({Cell, World}) end, Row).

map_cell({{alive, X, Y}, World}) ->
  LiveNeighbors = live_neighbors({alive,X,Y},World),

  CellStatus = if
    LiveNeighbors == 2 -> alive;
    LiveNeighbors == 3 -> alive;
    true -> dead
  end,

  {CellStatus,X,Y};

map_cell({{dead, X, Y}, World}) ->
  LiveNeighbors = live_neighbors({dead,X,Y},World),

  CellStatus = if
    LiveNeighbors == 3 -> alive;
    true -> dead
  end,

  {CellStatus,X,Y}.


live_neighbors(Cell, World) ->
  FlatWorld = lists:flatten(World),
  Neighbors = lists:filter(fun(PotentialNeighbor) -> neighbors(Cell, PotentialNeighbor) end, FlatWorld),
  length(lists:filter(fun({NeighborStatus, _, _}) -> NeighborStatus == alive end, Neighbors)).

neighbors(Cell1, Cell2) when Cell1 == Cell2 -> false;

neighbors({_,X1, Y1}, {_,X2, Y2}) ->
  XDiff = X2-X1,
  YDiff = Y2-Y1,
  math:sqrt((XDiff*XDiff)+(YDiff*YDiff)) < 2.
