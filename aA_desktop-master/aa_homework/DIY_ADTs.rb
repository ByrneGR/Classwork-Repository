class Stack
    attr_reader :arr
    def initialize
        @arr = []
    end

    def push(el)
        arr.push(el)
    end

    def pop
        arr.pop
    end

    def peek
        arr.last
    end
    
end

class Queue
    attr_reader :arr
    def initialize
        @arr = []
    end

    def enqueue(el)
        arr.push(el)
    end

    def dequeu
        arr.shift
    end

    def peek
        arr.first
    end
end

class Map
    attr_reader :arr

    def initialize
        @arr = []
    end

    def set(key, value)
        index_of_pair = @arr.index { |pair| pair[0] == key }
        if index
            @arr[index_of_pair][1] = value
        else
            @arr.push([key, value])
        end
    end

    def get(key)
        @arr.each do |pair|
            pair[1] if pair[0] == key
        end
        nil
    end

    def delete(key)
        @arr.reject! { |pair| pair[0] == key }
        get(key)
    end

    def show
        @arr.deep_dup
    end

    def deep_dup
        @arr.map { |ele| ele.is_a? Array ? ele : deep_dup(ele) }
    end
end
#changes