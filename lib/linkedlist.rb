module LinkedList
  # Sets the Node Class for use inside of a linked-list
  class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  # Creates the linked list and extends node properties.
  class LinkedList
    def empty?
      @head.nil?
    end

    def append(value)
      if @head.nil?
        @head = Node.new(value)
        return
      end

      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value, nil)
    end

    def prepend(value)
      @head = Node.new(value, @head)
    end

    def size
      return 0 if @head.nil?

      count = 1
      current_node = @head
      until current_node.next_node.nil?
        count += 1
        current_node = current_node.next_node
      end

      count
    end

    def head
      @head.value
    end

    def tail
      tail = @head
      tail = tail.next_node until tail.next_node.nil?
      tail.value
    end

    def at(index)
      return "Out of Bounds!" if index > size

      count = 0
      current_node = @head
      until count == index
        current_node = current_node.next_node unless current_node.next_node.nil?
        count += 1
      end
      current_node.value
    end

    def to_a
      array = []
      current_node = @head
      return array if empty?

      until current_node.next_node.nil?
        array << current_node.value
        current_node = current_node.next_node
      end
      array << current_node.value

      array
    end

    def to_s
      nodes_str = to_a.map { |value| "( #{value} )" }.join(" -> ")
      puts " #{nodes_str} -> nil"
    end
  end
end
