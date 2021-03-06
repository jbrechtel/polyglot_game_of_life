require 'lib/life'

class Parser
  def self.world_from(world_s)
    World.new(world_s.split(/\n/).map do |line|
      line.chars.map do |cell_s|
        Cell.new((cell_s == ' ' ? :alive : :dead))
      end
    end.reject {|r| r.count == 0})
  end
end

world = Parser.world_from %{
................................
................................
................................
   .  .  .   ....   .. ... .....
   .  .  ... ....   .. ..... ...
   .  .  .   .    .... ......  .
................................
................................
................................
}

100.times do
  puts "\e[H\e[2J"
  puts world
  sleep(1) unless ARGV[0] == 'f'
  f = Fate.new(world)
  world = World.new(world.rows.map { |row| row.map { |cell| f.of(cell) } })
end


