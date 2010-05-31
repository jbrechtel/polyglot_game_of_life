class World
  include Math

  def initialize(rows)
    @rows = rows
    @max_x = rows.first.count - 1
    @max_y = rows.count - 1
  end

  def cache_coords
    @rows.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.x = x
        cell.y = y
      end
    end
  end

  def neighbors_of(cell)
    neighbors = [[0,1], [1, 0], [1, 1], [0, -1], [-1, 0], [-1, -1], [1,-1], [-1,1]].map do |(x,y)|
        new_x = cell.x + x
        new_y = cell.y + y
        new_x =
        case new_x
          when -1 then @max_x
          when @max_x + 1 then 0
          else new_x
        end

        new_y =
        case new_y
          when -1 then @max_y
          when @max_y + 1 then 0
          else new_y
        end
        [new_x,new_y]
    end.reject {|(x,y)| cell.x == x && cell.y == y}.uniq

    neighbors.map do |(x,y)|
      @rows[y][x]
    end.select {|neighbor| (block_given? ? yield(neighbor) : true) }
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
    return cell.x,cell.y
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
