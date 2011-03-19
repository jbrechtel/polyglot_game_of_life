package gol

import gol.TypeAliases._

object World {
  def apply(width: Int, height: Int) = {
    val cells = for(x <- (1 to width))
                  yield for(y <- (1 to height))
                    yield new Cell(false, (x-1,y-1))

    new World(cells)
  }
}

class World private (val cells: Cells) {
  type Coordinate = (Int,Int)

  def cellAt(coord: Coordinate) = {
    val (x,y) = coord
    cells(x)(y)
  }

  def live(coords: Coordinate*) { coords.foreach(cellAt(_).live()) }
  def kill(coords: Coordinate*) { coords.foreach(cellAt(_).kill()) }
}
