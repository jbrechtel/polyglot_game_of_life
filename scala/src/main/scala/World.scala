package gol

object World {
  def apply(width: Int, height: Int) = {
    val cells = for(x <- (1 to width))
                  yield for(y <- (1 to height))
                    yield new Cell(false)

    new World(cells)
  }
}

class World private (val cells: IndexedSeq[IndexedSeq[Cell]]) {
  def cellAt(coords: (Int,Int)) = {
    coords match {
      case (x,y) => cells(x)(y)
    }
  }

  def bear(coords: (Int,Int)*) = {
    val finalCells = coords.foldLeft(cells)((newCells, coord) => {
      coord match {
        case (x,y) => {
          val newRow = newCells(x).updated(y, new Cell(true))
          newCells.updated(x, newRow)
        }
      }
    })

    new World(finalCells)
  }

  def kill(coords: (Int, Int)*) = {
    val finalCells = coords.foldLeft(cells)((newCells, coord) => {
      coord match {
        case (x,y) => {
          val newRow = newCells(x).updated(y, new Cell(false))
          newCells.updated(x, newRow)
        }
      }
    })

    new World(finalCells)
  }
}
