## A simple stack machine

require 'pp'

def op_add( stack )
  left  = stack.pop
  right = stack.pop
  stack.push( left + right )
end

def op_2( stack )
  stack.push( 2 )
end

## Let's run!

stack = []
pp op_2( stack )     #=> stack = [2]
pp op_2( stack )     #=> stack = [2,2]
pp op_add( stack )   #=> stack = [4]
