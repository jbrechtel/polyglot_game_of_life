class World
  include Math

  def initialize(rows)
    @rows = rows
  end

  def neighbors_of(cell)
    @rows.map do |row|
      row.select do |potential_neighbor|
        (block_given? ? yield(potential_neighbor) : true) &&
          neighbors?(cell, potential_neighbor)
      end
    end.flatten
  end

  def live_neighbors_of(cell)
    neighbors_of(cell) {|neighbor| neighbor.alive?}
  end

  def dead_neighbors_of(cell)
    neighbors_of(cell) {|neighbor| !neighbor.alive?}
  end

  def rows
    @rows
  end

  def to_s
    @rows.map do |row|
      row.join
    end.join("\n")
  end

  private
  def neighbors?(cell1, cell2)
    distance = distance(*cell_coordinates(cell1), *cell_coordinates(cell2))
    distance >= 1 && distance < 2
  end

  def cell_coordinates(cell)
    x = @rows.detect { |row| row.include? cell }.index(cell)
    y = @rows.index(@rows.detect { |row| row.include? cell })
    return x,y
  end

  def distance(x1, y1, x2, y2)
    x_diff = x2-x1
    y_diff = y2-y1
    sqrt((x_diff*x_diff) + (y_diff*y_diff))
  end
end


class Array
  def distance_between(item1, item2)
    absolute_value(self.index(item1) - self.index(item2))
  end

  private
  def absolute_value(num)
    (num < 0 ? -1 : 1) * num
  end
end
