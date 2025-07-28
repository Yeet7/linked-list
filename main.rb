require_relative "lib/linkedlist"

list = LinkedList::LinkedList.new

list.append("cat")
list.append("dog")
list.prepend("horse")
list.append("cattle")

list.to_s
