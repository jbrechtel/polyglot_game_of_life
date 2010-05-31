require 'test/test_helper'

class WorldTest < Test::Unit::TestCase
  def test_world_knows_about_neighbors
    cell = Cell.new
    world = World.new [ [Cell.new, cell, Cell.new] ]
    assert_equal 2, world.neighbors_of(cell).count
  end

  def test_world_knows_disconnected_cells_arent_neighbors
    cell = Cell.new
    world = World.new [ [Cell.new, cell, Cell.new, Cell.new] ]
    assert_equal 2, world.neighbors_of(cell).count
  end

  def test_world_knows_about_neighbors_on_rows_below
    cell = Cell.new
    world = World.new [ [cell],
                        [Cell.new] ]
    assert_equal 1, world.neighbors_of(cell).count
  end

  def test_world_knows_about_diagonal_neighbors
    cell = Cell.new
    world = World.new [ [Cell.new, cell, Cell.new], [Cell.new, Cell.new, Cell.new] ]
    assert_equal 5, world.neighbors_of(cell).count
  end

  def test_world_knows_about_live_neighbors
    cell = Cell.new
    assert_equal 1, World.new([ [cell], [live_cell] ]).live_neighbors_of(cell).count
  end

  def test_world_should_wrap_the_inner_horizontal_edge_when_counting_neighbors
    cell = Cell.new
    assert_equal 2, World.new([ [cell, Cell.new, Cell.new] ]).neighbors_of(cell).count
    assert_equal 5, World.new([ [cell, Cell.new, Cell.new], [Cell.new, Cell.new, Cell.new ]]).neighbors_of(cell).count
  end

  def test_world_should_wrap_the_outer_horizontal_edge_when_counting_neighbors
    cell = Cell.new
    assert_equal 2, World.new([ [Cell.new, Cell.new, cell] ]).neighbors_of(cell).count
  end

  def test_world_should_wrap_the_lower_vertical_edge_when_counting_neighbors
    cell = Cell.new
    assert_equal 2, World.new([ [cell],
                                [Cell.new],
                                [Cell.new] ]).neighbors_of(cell).count
  end

  def test_world_should_wrap_the_upper_vertical_edge_when_counting_neighbors
    cell = Cell.new
    assert_equal 2, World.new([ [Cell.new],
                                [Cell.new],
                                [cell] ]).neighbors_of(cell).count
  end
end
