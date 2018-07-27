require 'byebug'

class KnightPathFinder

  attr_reader :valid_moves

  POSS = [[2, 1],
          [2, -1],
          [-2, 1],
          [-2, -1],
          [1, 2],
          [1, -2],
          [-1, 2],
          [-1, -2]]

  def initialize(pos1, pos2)
    @start = pos1.split(',')
    @finish = pos2.split(',')
    # @board = Array.new(8){Array.new(8)}
    # @visited = [pos1.split(',')]
    # puts build_move_tree(pos1.split(','))
    p bfs(@start, @finish)
  end
  #
  # def parse
  #   self.split(",")
  # end

  def new_move_positions(pos)
    arr = []
    POSS.each do |subarr|
      pos1 = []
    (0..1).each do |i|
      x = subarr[i] + pos[i].to_i
      pos1 << x if x >= 0 && x < 8
    end
    arr << pos1 if pos1.length > 1
    end

    arr
  end


  # def move_position
  #
  # end
  #
  # def self.valid_move(pos)
  #
  # end

  def bfs(start, finish)
    des = [start]
    move = des.shift
    debugger
    until move == finish
    des += new_move_positions(move)
    end

  end




  # def build_move_tree(pos)
  #   debugger
  #   visited = [pos]
  #   array = [pos]
  #   return pos if new_move_positions(pos).length <=1
  #
  #   new_move_positions(pos).each do |array|
  #     array += new_move_positions(array) if !visited.include?(new_move_positions(array))
  #     visited += array
  #   end

  #   array
  # end

end


if __FILE__ == $PROGRAM_NAME
  puts "start : ex. 1,2"
  start = gets.chomp
  puts "End : ex. 8,8"
  finish = gets.chomp
  KnightPathFinder.new(start, finish)
end
