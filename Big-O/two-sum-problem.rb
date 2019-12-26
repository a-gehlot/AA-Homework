def bad_two_sum?(arr, target)
    (0...arr.length).each do |index|
        (index + 1...arr.length).each do |index2|
            return true if arr[index] + arr[index2] == target
        end
    end

    false

end

def okay_two_sum?(arr, target)

    sorted = arr.sort
    
    i = arr.length - 1
    j = 0

    while i > j
        case (arr[i] + arr[j]) <=> target
        when 0
            return true
        when -1
             j += 1
        when 1
            i -= 1
        end
    end
    false


end

def bin_search(val, arr)
    middle = (arr.length - 1) / 2
    i = 0
    j = arr.length - 1

    while i < j
        if arr[middle] == val
            return true
        elsif arr[middle] < val 
            i = middle + 1
            middle = (i + j) / 2
        elsif arr[middle] > val
            j = middle - 1
            middle = (i + j) / 2
        end
    end

    false
end

def two_sum?(arr, target)
    combinations = {}

    arr.each do |val|
        return true if combinations[target - val]
        combinations[val] = true
    end

    false
end



arr = [0, 1, 5, 7]
puts two_sum?(arr, 6) # => should be true
puts two_sum?(arr, 10) # => should be false

# puts bin_search(5, [0,1,2,3,4,6])