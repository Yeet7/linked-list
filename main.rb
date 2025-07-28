require_relative "lib/linkedlist"

list = LinkedList::LinkedList.new

list.append("cat")
list.append("dog")
list.prepend("horse")
list.append("cattle")
list.prepend("turtle")

puts list.size
puts list.head
puts list.tail
puts list.at(5)

list.to_s
