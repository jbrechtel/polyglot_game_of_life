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
    coord match {
      case (x,y) => cells(x)(y)
    }
  }

  def bear(coords: Coordinate*) = changeCells(coords: _*) { cell => cell.bear }
  def kill(coords: Coordinate*) = changeCells(coords: _*) { cell => cell.kill }

  def changeCells(coords: Coordinate*)(changeFun: Cell => Cell) = {
    val finalCells = coords.foldLeft(cells)((newCells, coord) => {
      coord match {
        case (x,y) => {
          val newCell = changeFun(cellAt(coord))
          val newRow = newCells(x).updated(y, newCell)
          newCells.updated(x, newRow)
        }
      }
    })

    new World(finalCells)
  }
}
