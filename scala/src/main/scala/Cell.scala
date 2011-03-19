package gol

import gol.TypeAliases._

class Cell(val living: Boolean, val coord: Coordinate) {
  var isLiving = living;
  def dead = !isLiving
  def alive = isLiving
  def live() { isLiving = true }
  def kill() { isLiving = false }
}
