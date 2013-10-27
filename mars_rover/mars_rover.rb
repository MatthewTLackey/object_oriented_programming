

# Nouns: Rover
# Grid
#   -input "The first line of input is the upper right corner of the plateau"
# Coordinates
#   Directions - N, S, E, W
# Command: L, R, M

class Plateau
  attr_accessor :y, :x

  def initialize(x, y)
    @y = y
    @x = x
  end
end

class Rover
  attr_accessor :x, :y, :heading

  def initialize(x, y, heading)
    @x = x
    @y = y
    @heading = heading
  end

  def print_loc_and_heading
    print "X: #{@x} "
    print "Y: #{@y} "
    print heading
  end

  def execute_instructions(input_string)
    directions = input_string.split("")

    counter = 0
    until counter == directions.length do 
      if directions[counter] == "L" || directions[counter] == "R"
        change_heading(@heading, directions[counter])
      elsif directions[counter] == "M"
        move(@heading)
      else 
        puts "Improper input. Aborting."
      end
      counter += 1
    end
  end

  def change_heading(current_heading, new_heading)
    #puts "Begin turn. Beginning heading: #{current_heading}"
    if current_heading == "N"
      if new_heading == "R"
        @heading = "E"
      elsif new_heading == "L"
        @heading = "W"
      end
    elsif current_heading == "E"
       if new_heading == "R"
        @heading = "S"
      elsif new_heading == "L"
        @heading = "N"
      end
    elsif current_heading == "S"
       if new_heading == "R"
        @heading = "W"
      elsif new_heading == "L"
        @heading = "E"
      end
    elsif current_heading == "W"
       if new_heading == "R"
        @heading = "N"
      elsif new_heading == "L"
        @heading = "S"
      end
    end
    #puts "Turn complete. New heading: #{@heading}"
  end

  def move(current_heading)
    case current_heading
    when "N"
      @y += 1
    when "E"
      @x += 1

    when "S"
      @y -= 1

    when "W"
      @x -= 1
    end
    #print_loc_and_heading
  end



end




mars_plateau = Plateau.new(5, 5)

mohawk = Rover.new(1, 2, "N")
hercules = Rover.new(3, 3, "E")
mohawk.print_loc_and_heading
puts ""
hercules.print_loc_and_heading


mohawk.execute_instructions("LMLMLMLMM")

puts ""
hercules.print_loc_and_heading
hercules.execute_instructions("MMRMMRMRRM")
puts ""
hercules.print_loc_and_heading
