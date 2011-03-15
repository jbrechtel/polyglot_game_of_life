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
      new Cell(false, (0,0)).bear should be ('living)
    }

    it("should retain its coordinates") {
      val original = new Cell(false, (0,2))
      original.bear.coord should equal(original.coord)
    }
  }

  describe("killing") {
    it("should create a new cell that is dead") {
      new Cell(true, (0,0)).kill should be ('dead)
    }

    it("should retain its coordinates") {
      val original = new Cell(true, (0,2))
      original.kill.coord should equal(original.coord)
    }
  }
}
