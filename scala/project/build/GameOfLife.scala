import sbt._

class GameOfLifeProject(info: ProjectInfo) extends DefaultProject(info) {
  val scalatest = "org.scalatest" % "scalatest" % "1.3"
  val scalacheck = "org.scala-tools.testing" %% "scalacheck" % "1.8"
}
