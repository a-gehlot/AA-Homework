list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

#Phase I O(n^2)
def my_min(array)
    min = 0
    array.each_with_index do |num1, idx1|
        min = num1 if array.all? { |num2| num1 <= num2 }
        end
    min
end

p my_min(list)

#Phase II O(n)
def my_new_min(array)
    min = array[0]
    array.each do |num|
        min = num if num < min 
    end
    min
end

p my_new_min(list)

#Largest Contiguous Sub-sum

list2 = [5, 3, -7]
list3 = [2, 3, -6, 7, -6, 7]
list4 = [-5, -1, -3]

#Phase I 
def largest_contiguous_subsum(list)
   sub_arrays = []
   list.each_with_index do |num1, idx1|
        sub_arrays << [num1]
        (idx1 + 1...list.count).each do |idx2|
            sub_arrays << list[idx1..idx2]
        end
    end
    sum = sub_arrays[0].sum
    sub_arrays.each do |subsum|
        if subsum.sum > sum
            sum = subsum.sum 
        end
    end
    sum

end

p largest_contiguous_subsum(list2)
p largest_contiguous_subsum(list3)
p largest_contiguous_subsum(list4)

#Phase II
def largest_contiguous_subsum_fast(list)
    largest = list.first
    current = list.first

    return list.max if list.all? { |num| num < 0 }

    list.drop(1).each do |num|
        current += num 
        current = 0 if current < 0
        largest = current if current > largest 
    end
    largest 
end

p largest_contiguous_subsum_fast(list2)
p largest_contiguous_subsum_fast(list3)
p largest_contiguous_subsum_fast(list4)



