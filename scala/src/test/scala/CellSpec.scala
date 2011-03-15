package gol
import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class CellSpec extends Spec with ShouldMatchers {
  describe("dead") {
    it("should be false when the cell is living") {
      new Cell(true).dead should be (false)
    }

    it("should be true when the cell is not living") {
      new Cell(false).dead should be (true)
    }
  }
}

