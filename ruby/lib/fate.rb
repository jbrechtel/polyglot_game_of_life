class Fate

  def initialize(world)
    @world = world
  end

  def of(cell)
    should_live?(cell) ? Cell.new(:alive) : Cell.new(:dead)
  end

  private
  def should_live?(cell)
    if(cell.alive?)
      return true if([2,3].include?(@world.live_neighbors_of(cell).count))
      return false
    else
      return true if(@world.live_neighbors_of(cell).count == 3)
      return false
    end
  end
end
