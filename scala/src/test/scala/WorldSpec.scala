package gol
import org.scalatest.Spec
import org.scalatest.matchers.ShouldMatchers

class WorldSpec extends Spec with ShouldMatchers {
  describe("a world") {
    describe("constructing a world") {
      it("should create a world full of dead cells") {
        World(1,1).cellAt((0,0)) should be ('dead)
      }

      it("should create cells with proper coordinates") {
        World(1,2).cellAt((0,1)).coord should equal((0,1))
      }

      it("should create a world with live cells at the specified locations") {
        val world = World(3,3, liveCoords=List((0,1),(1,2)))
        world.cellAt((0,1)) should be ('living)
        world.cellAt((1,2)) should be ('living)
      }
    }

    describe("bringing a cell to life") {
      it("should return a new world with the specified cell alive") {
        val world = World(1,1)
        world.live((0,0))
        world.cellAt((0,0)) should not be ('dead)
      }

      it("should bring multiple cells to life") {
        val world = World(1,2)
        world.live((0,0), (0,1))
        world.cellAt((0,0)) should not be ('dead)
        world.cellAt((0,1)) should not be ('dead)
      }

      it("should retain cell coordinates when bearing cells") {
        val world = World(1,2)
        world.live((0,1))
        world.cellAt((0,1)).coord should equal((0,1))
      }
    }

    describe("killing a cell") {
      it("should return a new world with the specified cell dead") {
        val world = World(1,1)
        world.kill((0,0))
        world.cellAt((0,0)) should be ('dead)
      }

      it("should kill multiple cells") {
        val world = World(1,2)
        world.kill((0,1))
        world.cellAt((0,0)) should be ('dead)
        world.cellAt((0,1)) should be ('dead)
      }
    }
  }
}
