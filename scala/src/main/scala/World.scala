package gol

import gol.TypeAliases._

object World {
  def apply(width: Int, height: Int, liveCoords: List[Coordinate] = List()) = {
    val cells = for(x <- (0 to width-1))
                  yield for(y <- (0 to height-1))
                    yield new Cell(liveCoords.contains((x,y)), (x,y))

    new World(cells)
  }
}

class World private (val cells: Cells) {
  type Coordinate = (Int,Int)
  lazy val flatCells = cells.flatten

  def cellAt(coord: Coordinate) = {
    val (x,y) = coord
    cells(x)(y)
  }

  def live(coords: Coordinate*) { coords.foreach(cellAt(_).live()) }
  def kill(coords: Coordinate*) { coords.foreach(cellAt(_).kill()) }
}
