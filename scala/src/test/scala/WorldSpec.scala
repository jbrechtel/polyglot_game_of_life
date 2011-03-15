package gol
import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class WorldSpec extends Spec with ShouldMatchers {
  describe("a world") {
    describe("constructing a world") {
      it("should create a world full of dead cells") {
        val world = new World(1,1)
        world.cellAt(1,1) should be ('dead)
      }
    }
  }
}
