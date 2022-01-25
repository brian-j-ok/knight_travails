require 'pp'
require_relative 'knight'

class Game
  def initialize(start_arr, end_arr)
    @knight = Knight.new(start_arr)
    pp knight_moves(@knight, end_arr)
  end

  def knight_moves(node = @knight, last = @end_arr)
    queue = [node]
    history = []
    until queue[0].position == last
      current_node = queue[0]
      current_node.children.each do |child|
        queue << Knight.new(child, current_node)
      end
      queue.delete_at(0)
    end

    current_node = queue[0]

    loop do
      history << current_node.position
      current_node = current_node.parent
      break if current_node.nil?
    end

    history.reverse
  end
end

game = Game.new([0, 0], [6, 6])
