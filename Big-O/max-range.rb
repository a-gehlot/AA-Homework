require "benchmark"
include Benchmark

def windowed_max_range(array, window)
    current_max_range = nil
    i = 0
    until window == array.length + 1
        sub_arr = array[i...window]
        if (current_max_range.nil?) || sub_arr.max - sub_arr.min > current_max_range
            current_max_range = sub_arr.max - sub_arr.min
        end
        i += 1
        window += 1
    end

    current_max_range
end


class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store[-1]
    end

    def enqueue(element)
        @store.unshift(element)
    end

    def dequeue
        @store.shift
    end

    def empty?
        @store.empty?
    end


end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(element)
    @store.push(element)
  end

end


class StackQueue
    def initialize
        @en_stack = MyStack.new
        @de_stack = MyStack.new
    end

    def empty?
        @en_stack.empty? && @de_stack.empty?
    end

    def size
        @en_stack.size + @de_stack.size
    end

    def enqueue(element)
        @en_stack.push(element)
    end

    def dequeue
        if @de_stack.empty?
            until @en_stack.empty?
                @de_stack.push(@en_stack.pop)
            end
        end
        @de_stack.pop
    end
end

class MinMaxStack
    def initialize
        @store = MyStack.new
    end

    def peek
        @store.peek[:value] unless empty?
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def max
        @store.peek[:max] unless empty?
    end

    def min
        @store.peek[:min] unless empty?
    end

    def pop
        @store.pop[:value] unless empty?
    end

    def push(val)
        @store.push({ max: new_max(val), min: new_min(val), value: val})
    end

    private

    def new_max(value)
        empty? ? value : [max, value].max
    end

    def new_min(value)
        empty? ? value : [min, value].min
    end
end

class MinMaxStackQueue
    def initialize
        @en_stack = MinMaxStack.new
        @de_stack = MinMaxStack.new
    end

    def size
        @en_stack.size + @de_stack.size
    end

    def empty?
        @en_stack.empty? && @de_stack.empty?
    end

    def enqueue(element)
        @en_stack.push(element)
    end

    def dequeue
        if @de_stack.empty?
            until @en_stack.empty?
                @de_stack.push(@en_stack.pop)
            end
        end
        @de_stack.pop
    end

    def max
        maxes = []
        maxes << @en_stack.max unless @en_stack.empty?
        maxes << @de_stack.max unless @de_stack.empty?
        maxes.max
    end

    def min
        mins = []
        mins << @en_stack.min unless @en_stack.empty?
        mins << @de_stack.min unless @de_stack.empty?
        mins.min
    end

end

def windowed_max_range_best(array, window)
    queue = MinMaxStackQueue.new
    array[0...window].each { |p| queue.enqueue(p) }
    windowed_max_range = queue.max - queue.min
    until window == array.length
        queue.dequeue
        queue.enqueue(array[window])
        # puts queue.max
        # puts queue.min
        if queue.max - queue.min > windowed_max_range
            windowed_max_range = queue.max - queue.min
        end
        window += 1
    end
    windowed_max_range
end

# def windowed_max_range_best(array, window)
#     queue = MinMaxStackQueue.new
#     best_range = nil

#     array.each_with_index do |el, i|
#         queue.enqueue(el)
#         queue.dequeue if queue.size > window

#         if queue.size == window 
#             current_range = queue.max - queue.min
#             best_range = current_range if !best_range || current_range > best_range
#         end
#     end

#     best_range
# end


def random_arr(n)
    array = Array.new(n) { rand(n) }
    val = rand(0..n)
    return array
end

Benchmark.benchmark(CAPTION, 7, FORMAT) do |x|
    x.report("Original O(n^2):") { windowed_max_range(random_arr(1000000), 10000)}
    x.report("Optimized O(n):") { windowed_max_range_best(random_arr(1000000), 10000)}
end







# puts windowed_max_range_best([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# puts windowed_max_range_best([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# puts windowed_max_range_best([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# puts windowed_max_range_best([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8