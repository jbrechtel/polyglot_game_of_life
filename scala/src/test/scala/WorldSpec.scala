package gol
import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class WorldSpec extends Spec with ShouldMatchers {
  describe("a world") {
    describe("constructing a world") {
      it("should create a world full of dead cells") {
        World(1,1).cellAt((0,0)) should be ('dead)
      }
    }

    describe("bringing a cell to life") {
      it("should return a new world with the specified cell alive") {
        val world = World(1,1)
        val newWorld = world.bear((0,0))
        newWorld.cellAt((0,0)) should not be ('dead)
      }
    }
  }
}
