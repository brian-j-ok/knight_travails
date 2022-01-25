class Knight
  attr_accessor :position, :children, :parent

  MOVES = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]

  def initialize(starting_position, parent = nil)
    @position = starting_position
    @children = []
    @parent = parent
    move_options
  end

  def move_options
    MOVES.each do |move|
      x_move = position[0] + move[0]
      y_move = position[1] + move[1]
      if within_boundary?(x_move, y_move)
        puts "#{x_move}, #{y_move}"
      end
      @children << [x_move, y_move] if within_boundary?(x_move, y_move)
    end
  end

  def within_boundary? (x_position, y_position)
    return true if (x_position >= 0 && x_position < 8) && (y_position >= 0 && y_position < 8)

    false
  end
end