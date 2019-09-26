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
    if start_pos < 0 || start_pos > 12
      raise "Starting cup is empty"
    end
    valid_pos = (0..5).to_a + (7..12).to_a
    unless valid_pos.include?(start_pos)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].count
    @cups[start_pos].clear
    current_player_name == @name1 ? store_idx = 6 : store_idx = 13
    while num_stones > 0
      index = (start_pos + 1) % @cups.length
      if (store_idx == 6 && index == 13) || (store_idx == 13 && index == 6)
        start_pos += 1
        next
      end
      @cups[index] << :stone
      start_pos += 1
      num_stones -= 1
    end
    render
    self.next_turn((start_pos) % cups.length)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |sub| sub.empty? } || @cups[7..12].all? { |sub| sub.empty? }
      return true
    end
    false
  end

  def winner
      if @cups[6].count == @cups[13].count
        return :draw
      elsif @cups[6].count > @cups[13].count
        return @name1
      else
        return @name2
    end
  end
end
