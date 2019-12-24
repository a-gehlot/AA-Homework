def anagram?(word, test)
    anagrams = all_anagram(word)
    anagrams.include?(test)
end

def all_anagram(string)
    return [string] if string.size < 2

    first = string[0]
    # p first
    perms = all_anagram(string[1..-1])
    anagrams = []

    perms.each do |perm|
        anagrams << first + perm
        (1...perm.length).each do |i|
            # p perm[0..i]
            anagrams << (perm[0...i] + first + perm[i..-1])
        end
        anagrams << perm + first
    end

    anagrams


end


def second_anagram?(word, test)
    arr1, arr2 = word.split(""), test.split("")
    arr1.each do |char|
        i = arr2.find_index(char)
        return false if i.nil?
        arr2.delete_at(i)
    end

    arr2.empty?

end

def third_anagram?(word, test)
    word.chars.sort == test.chars.sort

end
# puts all_anagram("ab")

def fourth_anagram?(word, test)
    first = Hash.new(0)
    second = Hash.new(0)
    word.each_char do |char|
        first[char] += 1
    end
    test.each_char do |char|
        second[char] += 1
    end

    first == second
end


puts fourth_anagram?("gizmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true