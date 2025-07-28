require_relative "lib/linkedlist"

list = LinkedList::LinkedList.new

list.append("cat")
list.append("dog")
list.prepend("horse")
list.append("cattle")
list.prepend("turtle")

list.to_s

puts list.contains?("cat")
puts list.contains?("lion")

puts list.find("cat")
puts list.find("lion")
