require 'test/test_helper'

class FateTest < Test::Unit::TestCase
  def test_live_cell_with_no_neighbors_should_die
    cell = live_cell
    world = World.new [[cell]]
    assert !Fate.new(world).of(cell).alive?
  end

  def test_live_cell_with_two_live_neighbors_should_live
    cell = live_cell
    world = World.new([[live_cell,cell,live_cell]])
    assert Fate.new(world).of(cell).alive?
  end

  def test_live_cell_with_three_live_neighbors_should_live
    cell = live_cell
    world = World.new([[live_cell,cell,live_cell], [live_cell, dead_cell, dead_cell]])
    assert Fate.new(world).of(cell).alive?
  end

  def test_live_cell_with_more_than_three_live_neighbors_should_die
    cell = live_cell
    world = World.new([[live_cell, cell, live_cell],
                       [live_cell, live_cell, dead_cell]])
    assert !Fate.new(world).of(cell).alive?
  end

  def test_dead_cell_with_two_live_neighbors_should_stay_dead
    cell = dead_cell
    world = World.new([[live_cell, cell, live_cell]])
    assert !Fate.new(world).of(cell).alive?
  end

  def test_dead_cell_with_three_live_neighbors_should_live
    cell = dead_cell
    world = World.new([[live_cell, cell, live_cell], [live_cell, dead_cell, dead_cell]])
    assert Fate.new(world).of(cell).alive?
  end
end
