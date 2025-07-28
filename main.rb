require_relative "lib/linkedlist"

list = LinkedList::LinkedList.new

list.append("cat")
list.append("dog")
list.prepend("turtle")

list.to_s

list.insert_at("bird", 1)

list.to_s
