require_relative "lib/linkedlist"

list = LinkedList::LinkedList.new

list.append("cat")
list.append("dog")
list.prepend("horse")
list.append("cattle")
list.prepend("turtle")

list.to_s

list.pop

list.to_s
