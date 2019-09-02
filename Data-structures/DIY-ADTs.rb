  class Stack

    def initialize
      @stack = []
    end

    def push(el)
      @stack << el
    end

    def pop
      @stack.shift
    end

    def peek
      @stack[-1]
    end
  end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue[-1]
  end
end

class Map

  def initialize
    @map = []
  end

  def set(key, value)
    @map.each do |subarr|
      if subarr[0] == key
        subarr[1..-1] = value
        return
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each do |subarr|
      if subarr[0] == key
        return subarr[1..-1]
      end
    end
  end

  def delete(key)
    @map.each do |subarr|
      if subarr[0] == key
        @map.delete(subarr)
      end
    end
  end

  def show
    print @map
  end
end



        
    
