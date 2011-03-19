package gol
import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class CellSpec extends Spec with ShouldMatchers {
  describe("dead") {
    it("should be false when the cell is living") {
      new Cell(true, (0,0)).dead should be (false)
    }

    it("should be true when the cell is not living") {
      new Cell(false, (0,0)).dead should be (true)
    }
  }

  describe("bearing") {
    it("should create a new cell that is alive") {
      val cell = new Cell(false, (0,0))
      cell.live()
      cell should be ('alive)
    }

    it("should retain its coordinates") {
      val cell = new Cell(false, (0,2))
      cell.live()
      cell.coord should equal((0,2))
    }
  }

  describe("killing a cell") {
    it("should cause a cell to be dead") {
      val cell = new Cell(true, (0,0))
      cell.kill()
      cell should be ('dead)
    }

    it("should retain its coordinates") {
      val cell = new Cell(true, (0,2))
      cell.kill()
      cell.coord should equal((0,2))
    }
  }
}
