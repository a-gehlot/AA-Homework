class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        (0...4).each { |x| cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos == 0
      raise "Starting cup is empty"
    end
    valid_pos = (1..6).to_a + (7..12).to_a
    unless valid_pos.include?(start_pos)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].count
    @cups[start_pos].clear
    current_player_name == @name2 ? store_idx = 6 : store_idx = 13
    while num_stones > 0
      index = (start_pos + 1) % @cups.length
      if index == store_idx
        start_pos += 1
        next
      end
      @cups[index] << :stone
      start_pos += 1
      num_stones -= 1
    end
    render
    self.next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
