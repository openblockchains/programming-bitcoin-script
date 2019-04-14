## A simple stack machine

require 'pp'

def op_true( stack )
  stack.push( 1 )
end

## Let's run!

pp stack = []        #=> []
##  I) ScriptSig (input/unlock) part
pp op_true( stack )  #=> [1]

## II) ScriptPubKey (output/lock) part
##      <Empty>
