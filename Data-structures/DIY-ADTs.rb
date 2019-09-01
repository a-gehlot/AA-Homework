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