package gol

import gol.TypeAliases._

case class Cell(living: Boolean, coord: Coordinate) {
  def dead = !living
  def bear = new Cell(true, coord)
  def kill = new Cell(false, coord)
}
