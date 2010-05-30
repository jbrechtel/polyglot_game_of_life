require 'lib/life'
require 'test/unit'


def live_cell
  Cell.new :alive
end

def dead_cell
  Cell.new :dead
end
