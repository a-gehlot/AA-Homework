# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

#O(n^2)

def sluggish_octopus(array)
    max = array[0]
    array.each_with_index do |e1, i1|
        array.each_with_index do |e2, i2| 
            next if e1 == e2 
            if e2.length > e1.length
                max = e2 
            end
        end
    end
    max 
end

p sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

#O(nlogn)

def dominant_octopus(array)
    return array if array.size <= 1
    mid = array.size / 2
    left = array[0...mid]
    right = array[mid..-1]
    merged = merge(dominant_octopus(left), dominant_octopus(right))
end

def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
        if left.first.size <= right.first.size
            sorted << left.shift
        else
            sorted << right.shift 
        end
    end
    sorted.concat(left).concat(right)
end
    

p dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']).last

#O(n)
def clever_octopus(array)
    longest = array[0]
    array.each do |string|
        next if string.size <= longest.size
        longest = string 
    end
    return longest 
end

p clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# dancing octopus

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

#O(n)

def slow_dance(tile, array)
    array.each_with_index do |pos, idx|
        if pos == tile 
            return idx 
        end
    end
end



p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }


#O(1)

def fast_dance(tile, hash)
    return hash[tile]
end

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)






        