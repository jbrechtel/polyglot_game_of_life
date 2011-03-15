package gol

object World {
  def apply(width: Int, height: Int) = {
    new World(IndexedSeq(IndexedSeq(new Cell(false))))
  }
}

class World private (cells: IndexedSeq[IndexedSeq[Cell]]) {
  def cellAt(coords: (Int,Int)) = {
    coords match {
      case (x,y) => cells(x)(y)
    }
  }

  def bear(coords: (Int,Int)) = {
    coords match {
      case (x,y) => {
        val newRow = cells(x).updated(y, new Cell(true))
        val newCells = cells.updated(x, newRow)
        new World(newCells)
      }
    }
  }
}
