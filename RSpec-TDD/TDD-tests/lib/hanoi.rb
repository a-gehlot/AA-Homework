class TowerofHanoi
    attr_accessor :towers

    def initialize
        @towers = [[3,2,1],[],[]]
    end

    def move
        change_pos(user_gets_take, user_gets_put)
    end

    def render
       puts "tower 1: #{@towers[0]}"
       puts "tower 2: #{@towers[1]}"
       puts "tower 3: #{@towers[2]}" 
    end

    def change_pos(i, out)
        raise(ArgumentError) if @towers[i].empty?
        raise(ArgumentError) if @towers[i].first < @towers[out].first unless @towers[out].empty?
        piece_move = @towers[i].shift
        @towers[out].unshift(piece_move)
    end

    def end?
        if @towers[0].empty? && @towers.one? { |ele| ele == [3,2,1] }
            return true
        end
        false
    end

    def user_gets_take
        puts "which tower to take from"
        take = gets.chomp.to_i - 1
    end

    def user_gets_put
        puts "which tower to move to"
        put = gets.chomp.to_i - 1
    end

    def play
        until end?
            self.render
            self.move
            system("clear")
        end
        puts "you win"
    end


end

if $PROGRAM_NAME == __FILE__
    TowerofHanoi.new.play
end