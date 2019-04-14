## p2pk - Pay-to-pubkey bitcoin (standard) script

require 'pp'

## Bitcoin crypto helper

class Bitcoin
  def self.checksig( sig, pubkey )
    ## "crypto" magic here
    ##  for testing always return false for now
    false
  end
end


## A simple stack machine

def op_checksig( stack )
  pubkey = stack.pop
  sig    = stack.pop
  if Bitcoin.checksig( sig, pubkey )
    stack.push( 1 )
  else
    stack.push( 0 )
  end
end

## Let's run!

stack = []
##  I) ScriptSig (input/unlock) part
pp stack.push( "<sig>" )   #=> stack = ["<sig>"]

## II) ScriptPubKey (output/lock) part
pp stack.push( "<pubkey")  #=> stack = ["<sig>", "<pubkey>" ]
pp op_checksig( stack )    #=> stack = [0]
