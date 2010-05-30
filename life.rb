require 'lib/life'

dead_cell = Cell.new :dead

world = World.new [
                    [Cell.new, Cell.new, Cell.new],
                    [Cell.new, Cell.new, dead_cell],
                    [Cell.new, Cell.new, Cell.new]
                  ]

puts world.to_s

10.times do
  f = Fate.new(world)
  world = World.new(world.rows.map { |row| row.map { |cell| f.of(cell) } })
  puts "\n\n"
  puts world.to_s
end

