class World
  include Math

  def initialize(rows)
    @rows = rows
    @max_x = rows.first.count - 1
    @max_y = rows.count - 1
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
    return false if cell1 == cell2
    cell1_x, cell1_y = cell_coordinates(cell1)
    cell2_x, cell2_y = cell_coordinates(cell2)

    if(cell1_x == 0 && cell2_x == @max_x)
      cell2_x = -1
    elsif(cell1_x == @max_x && cell2_x == 0)
      cell1_x = -1
    end

    if(cell1_y == 0 && cell2_y == @max_y)
      cell2_y = -1
    elsif(cell1_y == @max_y && cell2_y == 0)
      cell1_y = -1
    end

    distance = distance(cell1_x, cell1_y, cell2_x, cell2_y)
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
