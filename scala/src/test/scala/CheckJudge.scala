package gol

import org.scalacheck._
import org.scalacheck.Prop.forAll

object JudgeSpecification extends Properties("Judge") {

    val worldGen = for {
                     x <- Gen.choose(1, 100)
                     y <- Gen.choose(1, 100)
                     numLiveCells <- Gen.choose(1, x*y)
                     liveXs <- Gen.listOfN(numLiveCells, Gen.choose(0,x))
                     liveYs <- Gen.listOfN(numLiveCells, Gen.choose(0,y))
     } yield World(x,y, liveCoords=liveXs.zip(liveYs))

    implicit def arbitraryWorld: Arbitrary[World] = Arbitrary { worldGen }

    //property("live cells") = forAll { (w: World) => w.cellAt((0,0)).dead }
}
