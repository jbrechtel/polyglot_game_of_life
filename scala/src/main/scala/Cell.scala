package gol

case class Cell(living: Boolean) {
  def dead = !living
}
