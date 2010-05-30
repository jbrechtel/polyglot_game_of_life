require 'lib/life'

class Parser
  def self.world_from(world_s)
    World.new(world_s.split(/\n/).map do |line|
      line.split(/ /).map do |cell_s|
        Cell.new((cell_s == '#' ? :alive : :dead))
      end
    end)
  end
end

dead_cell = Cell.new :dead

world = Parser.world_from %{
# - # - # - # # #
- # # # # - - # -
# - # - # - # # -
# # # # # - - # -
- - # - # - # - #
}

  puts world.to_s

100.times do
  f = Fate.new(world)
  world = World.new(world.rows.map { |row| row.map { |cell| f.of(cell) } })
  puts "\n\n"
  puts world.to_s
end


