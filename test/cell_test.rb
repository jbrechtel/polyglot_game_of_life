require 'test/test_helper'

class CellTest < Test::Unit::TestCase
  def test_cell_should_be_alive_by_default
    assert Cell.new.alive?
  end
end
