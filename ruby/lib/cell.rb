class Cell
  def initialize(state = :alive)
    @alive = true unless state == :dead
  end

  def alive?
    @alive
  end

  def to_s
    alive? ? "#" : "-"
  end
end
