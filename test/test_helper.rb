require 'lib/life'
require 'test/unit'


def live_cell
  Cell.new :alive
end

def dead_cell
  Cell.new :dead
end

def new_world(cells)
  world = World.new(cells)
  world.cache_coords
  world
end
