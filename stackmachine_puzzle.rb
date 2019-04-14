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

def op_4( stack )
  stack.push( 4 )
end

def op_equal( stack )
  left  = stack.pop
  right = stack.pop
  stack.push( left == right ? 1 : 0 )
end

## Let's run!

stack = []
##  I) ScriptSig (input/unlock) part
##      FIX!!! - add your "unlock" stack operation / operations here


## II) ScriptPubKey (output/lock) part
pp op_2( stack )      #=> stack = [?, 2]
pp op_add( stack )    #=> stack = [4]
pp op_4( stack )      #=> stack = [4,4]
pp op_equal( stack )  #=> stack = [1]
