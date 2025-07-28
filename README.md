# Overview
Implementation of a [linked list](https://en.wikipedia.org/wiki/Linked_list) in Ruby according a [general outline](https://www.theodinproject.com/lessons/ruby-linked-lists) provided by [The Odin Project](https://www.theodinproject.com/)

## Installation
Ensure Ruby is installed and simply clone this repository.
Run `Ruby main.rb` to execute the file.

### Usage
Provided methods include:
#method -> return

- [#append(value)](lib/linkedlist.rb#L21) -> nil
- [#prepend(value)](lib/linkedlist.rb#L37) -> nil
- [#remove(node)](lib/linkedlist.rb#L43)  -> node.value
  - *Note: for back-end use only*
- [#size](lib/linkedlist.rb#L50) -> int
- [#head](lib/linkedlist.rb#L67) -> node.value
- [#tail](lib/linkedlist.rb#L72) -> node.value
- [#at(index)](lib/linkedlist.rb#L79) -> node.value
- [#at_backend(index)](lib/linkedlist.rb#L96) -> node.value
  - *Note: for back-end use only, returns the node itself instead of value.*
- [#pop](lib/linkedlist.rb#L108) -> node.value
- [#contains(value)](lib/linkedlist.rb#L123) -> bool
- [#find(value)](lib/linkedlist.rb#L135) -> int
- [#insert_at(value, index)](lib/linkedlist.rb#L148) -> nil
- [#remove_at(index)](lib/linkedlist.rb#L169) -> nil
- [#to_a](lib/linkedlist.rb#L185) -> array
- [#to_s](lib/linkedlist.rb#L200) -> string 
