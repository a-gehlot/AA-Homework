def my_uniq(array)
    unique = []
    array.each do |element|
        unique << element unless unique.include?(element)
    end
    unique
end

def two_sum(array)
    sums = []
    (0...array.count - 1).each do |idx|
        (idx + 1...array.count).each do |idx2|
            if array[idx] + array[idx2] == 0
                sums << [idx, idx2]
            end
        end
    end
    sums
end

def my_transpose(array)
    transposed_array = Array.new(array.count) { Array.new(array.count) }
    (0...array.count).each do |ri|
        (0...array.count).each do |ci|
            transposed_array[ri][ci] = array[ci][ri]
        end
    end
    transposed_array

end

def stock_picker(array)
    pair = nil
    best_gain = 0
    (0...array.count).each do |buy|
          (buy + 1...array.count).each do |sell|
            profit = array[sell] - array[buy]
            unless profit < best_gain || profit < 0
                best_gain = profit
                pair = [buy, sell]
            end
        end
    end
    pair         

end



