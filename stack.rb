## A stack - last-in first out (LIFO) data structure

require 'pp'   ## pp = pretty print

pp stack = []                   #=> []
pp stack.empty?                 #=> true

pp stack.push( 1 )              #=> [1]
pp stack.empty?                 #=> false
pp stack.push( 2 )              #=> [1, 2]
pp stack.push( 3 )              #=> [1, 2, 3]
pp stack.push( "<signature>" )  #=> [1, 2, 3, "<signature>"]
pp stack.push( "<pubkey>")      #=> [1, 2, 3, "<signature>", "<pubkey>"]

pp stack.pop                    #=> "<pubkey>"
pp stack                        #=> [1, 2, 3, "<signature>"]
pp stack.pop                    #=> "<signature>"
pp stack                        #=> [1, 2, 3]

pp stack.push( 4 )              #=> [1, 2, 3, 4]
pp stack.push( 5 )              #=> [1, 2, 3, 4, 5]

pp stack.pop                    #=> 5
pp stack                        #=> [1, 2, 3, 4]
pp stack.pop                    #=> 4
pp stack                        #=> [1, 2, 3]
pp stack.pop                    #=> 3
pp stack                        #=> [1, 2]
pp stack.pop                    #=> 2
pp stack                        #=> [1]
pp stack.empty?                 #=> false
pp stack.pop                    #=> 1
pp stack                        #=> []
pp stack.empty?                 #=> true
pp stack.pop                    #=> nil
