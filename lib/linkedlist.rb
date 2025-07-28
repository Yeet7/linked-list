module LinkedList
  # Sets the Node Class for use inside of a linked-list
  class Node
    attr_accessor :value, :next_node

    # Technically could remove the default of nil to value, but for redundancy, best to keep it.
    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  # Creates the linked list and extends node properties.
  class LinkedList
    # Self explanatory, checks if the head is empty, which in turn means the list is empty.
    def empty?
      @head.nil?
    end

    # Adds a value to the end of the list
    def append(value)
      # If the list is empty, make the new value the head.
      if empty?
        @head = Node.new(value)
        return
      end

      # Sets current_node = @head, then loops until it finds the last node (by checking if the next is nil)
      # Creates a new node based on the position of the last node's
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value)
    end

    # Adds new node to beginning of list.
    # @head is going to equal the new value, and the previous head is now the next_node.
    def prepend(value)
      @head = Node.new(value, @head)
    end

    # Remove a node at a specific index,
    # Returns the value previously holding that index.
    def remove(node)
      value = node.next_node
      node.next_node = nil
      value
    end

    # Gets the size of the list
    def size
      # If there is no @head, the list is size 0.
      return 0 if @head.nil?

      # Iterate through each item and count how many there are.
      # (There is already one if the @head exists, and it starts at @head.)
      count = 1
      current_node = @head
      until current_node.next_node.nil?
        count += 1
        current_node = current_node.next_node
      end

      count
    end

    # Returns the value of the first node.
    def head
      @head.value
    end

    # Returns the value of the last node.
    def tail
      tail = @head
      tail = tail.next_node until tail.next_node.nil?
      tail.value
    end

    # Returns the value of the node at an index.
    def at(index)
      # If the index is larger than the size, it cannot be reached.
      return "Out of Bounds!" if index > size

      # Iterate through until it reaches the index.
      count = 0
      current_node = @head
      until count == index
        current_node = current_node.next_node unless current_node.next_node.nil?
        count += 1
      end
      # Return the value of the node at that index.
      current_node.value
    end

    # Accesses the actual node instead of value at an index - 1.
    # Useful for setting next_node = nil so the item isn't accessed and not just blank.
    def at_backend(index)
      count = 0
      current_node = @head
      until count == index - 1
        current_node = current_node.next_node unless current_node.next_node.nil?
        count += 1
      end
      current_node
    end

    # Removes the final node
    # Returns the value of said node
    def pop
      last_count = 0

      last_node = @head
      until last_node.next_node.nil?
        last_node = last_node.next_node
        last_count += 1
      end

      # removes @ position and then takes the value. Implicit return,
      # puts pop if want value.
      remove(at_backend(last_count)).value
    end

    # If the value is contained in the list, returns true, otherwise, false.
    def contains?(value)
      current_node = @head

      until current_node.next_node.nil?
        return true if current_node.value == value

        current_node = current_node.next_node
      end
      false
    end

    # Finds the index at which a value is, if not found, returns a string.
    def find(value)
      index = 0
      current_node = @head

      until current_node.next_node.nil?
        return "Found at index #{index}" if current_node.value == value

        current_node = current_node.next_node
      end
      "'#{value}' not found in list."
    end

    # Inserts a new node at a given index
    def insert_at(value, index)
      # Appends if index is larger than size
      # Prepends if index is 0 or lower.
      return append(value) if index >= size
      return prepend(value) if index <= 0

      # get to node at index, create a new node with (value, current_node)
      # loop back to previous node with at_backend(index).next_node = value
      count = 0
      current_node = @head
      until count == index
        current_node = current_node.next_node unless current_node.next_node.nil?
        count += 1
      end

      at_backend(count).next_node = Node.new(value, current_node)
    end

    # Removes a node at a given index
    # Starts at 0
    # if out of bounds, removes last value.
    def remove_at(index)
      return pop if index + 1 == size
      return @head = @head.next_node if index.zero?

      count = 0
      current_node = @head
      # Accesses the index back 2 to then access the node back one to set that node's next node.
      until count == index
        current_node = current_node.next_node unless current_node.next_node.nil?
        count += 1
      end

      at_backend(count).next_node = current_node.next_node
    end

    # Converts the entire list into an array
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

    # Converts array of list to a pleasant string.
    def to_s
      nodes_str = to_a.map { |value| "( #{value} )" }.join(" -> ")
      puts " #{nodes_str} -> nil"
    end
  end
end
