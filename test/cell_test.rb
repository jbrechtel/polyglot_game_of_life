require 'test/test_helper'

class CellTest < Test::Unit::TestCase
  def test_cell_should_be_alive_by_default
    assert Cell.new.alive?
  end

  def test_dead_cell_should_be_dead
    assert !Cell.new(:dead).alive?
  end

  def test_living_cell_should_be_alive
    assert Cell.new(:alive).alive?
  end
end
