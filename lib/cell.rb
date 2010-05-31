class Cell
  def initialize(state = :alive, x = 0, y = 0)
    @alive = true unless state == :dead
    @x = x
    @y = y
  end
  
  attr_accessor :x
  attr_accessor :y

  def alive?
    @alive
  end

  def to_s
    alive? ? "#" : "-"
  end
end
