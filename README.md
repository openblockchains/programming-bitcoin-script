# Programming Bitcoin Script Transaction (Crypto) Contracts Step-by-Step

_Let's start with building your own bitcoin stack machine from zero / scratch and let's run your own bitcoin ops (operations)..._


Did you know? Every (yes, every) bitcoin transaction (payment) runs
a contract script (one half coming from the "output" or "lock" transaction and the
other half coming from the "input" or "unlock" transaction).
The programming language is called simply (bitcoin) script.

> Bitcoin uses a scripting system for transactions.
> Forth-like, Script is simple, stack-based, and processed from left to right.
> It is intentionally not Turing-complete, with no loops.
>
> (Source: [Script @ Bitcoin Wiki](https://en.bitcoin.it/wiki/Script))


First impression. Adding 2+2 in Bitcoin Script starting from zero / scratch:

``` ruby
## A simple stack machine
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
op_2( stack )     #=> stack = [2]
op_2( stack )     #=> stack = [2,2]
op_add( stack )   #=> stack = [4]
```

Yes, that's all the magic! You have built your own stack machine with
two operations / ops, that is, `op_add` and `op_2`.

Push and Pop

The `op_2` operation pushes the number `2` onto the stack.
The `op_add` operation pops the top two numbers from the stack
and pushes the result onto the stack.  


In "real world" bitcoin the script has two parts / halves in two transactions
that get combined.
The "lock" or "output" or "ScriptSig" script
that locks the "unspent transaction output (UTXO)"
and the "unlock" or "input" or "ScriptPubKey" script that unlocks
the bitcoins.


Anyone Can Spend (Unlock) the Outputs (Bitcoins)

The bitcoins are yours if the bitcoins haven't been spent yet -
see blockchain and how it solves the double-spending problem :-) -
AND if the script returns with true, that is, `1` is on top of the stack.

``` ruby
## A simple stack machine
def op_true( stack )
  stack.push( 1 )
end

## Let's run!

stack = []
## scriptPubKey part
## - Empty

## scriptSig part
op_true( stack )  #=> stack = [1]
```

Bingo! Yes, that's all the magic!
The `op_true` operation pushes the number `1`, that is, `true` onto the stack.

The "official" bitcoin script notation reads:

```
scriptPubKey: (empty)
scriptSig:    OP_TRUE
```

Now let's split the adding `2+2` script into a two part puzzle,
that is, `?+2=4`
or into `scriptSig` and `scriptPubKey`.
 If you know the answer you can "unlock" the bounty,
that is, the bitcoin are yours!
Here's the challenge:

``` ruby
## A simple stack machine
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
## scriptPubKey part
## - add your "unlock" stack operation / operations here

## scriptSig part
op_2( stack )      #=> stack = [?, 2]
op_add( stack )    #=> stack = [4]
op_4( stack )      #=> stack = [4,4]
op_equal( stack )  #=> stack = [1]
```

The "official" bitcoin script notation reads:

```
scriptPubKey: ?
scriptSig:    OP_2 OP_ADD OP_4 OP_EQUAL
```


If you check all Bitcoin script operations -
the following ops should no longer be a mystery:

Constants

|Word | Opcode |Hex | Input | Output | Description|
|-----|--------|----|-------|--------|------------|
| OP_0, OP_FALSE |  0  |  0x00 | Nothing. | (empty value) |  An empty array of bytes is pushed onto the stack. (This is not a no-op: an item is added to the stack.) |
| OP_1, OP_TRUE  | 81  | 0x51  | Nothing. | 1 | The number 1 is pushed onto the stack. |
| OP_2-OP_16 | 82-96 |  0x52-0x60  | Nothing. |  2-16 |  The number in the word name (2-16) is pushed onto the stack. |

Bitwise logic

|Word | Opcode |Hex | Input | Output | Description|
|-----|--------|----|-------|--------|------------|
| OP_EQUAL | 135  | 0x87 | x1 x2  | True / false |  Returns 1 if the inputs are exactly equal, 0 otherwise. |

Arithmetic

|Word | Opcode |Hex | Input | Output | Description|
|-----|--------|----|-------|--------|------------|
| OP_ADD |  147  | 0x93  | a b | out  | a is added to b. |
| OP_MUL |  149  | 0x95  | a b | out  | a is multiplied by b. **disabled.** |
| OP_DIV |  150  | 0x96  | a b | out  | a is divided by b. **disabled.** |



Trivia Corner: Did you know? The `OP_MUL` for multiplications (e.g. `2*2`)
has been banned, that is, disabled!  Why?
Because of security concerns, that is, fear of stack overflows.
What about `OP_DIV` for divisions (e.g. `4/2`)?  Don't ask!
Ask who's protecting you from stack underflows?
So what's left for programming - not much really :-).



To be continued ...





## Standard Scripts


| Short Name | Long Name  |
|------------|------------|
| p2pk   | Pay-to-pubkey     |
| p2pkh  | Pay-to-pubkey-hash |
| p2sh   | Pay-to-script-hash  |
| p2wpkh | Pay-to-witness-pubkey-hash  |
| p2wsh  | Pay-to-witness-script-hash  |




## Resources

Articles

- [Bitcoin Script @ Bitcoin Wiki](https://en.bitcoin.it/wiki/Script)


Books

- [Programming Bitcoin from Scratch](https://github.com/jimmysong/programmingbitcoin) by Jimmy Song
  - [Chapter 6 - Script](https://github.com/jimmysong/programmingbitcoin/blob/master/ch06.asciidoc) - How Script Works • Example Operations • Parsing the Script Fields • Combining the Script Fields • Standard Scripts • p2pk • Problems with p2pk • Solving the Problems with p2pkh • Scripts Can Be Arbitrarily Constructed • Conclusion
  - [Chapter 8 - Pay-to-Script Hash](https://github.com/jimmysong/programmingbitcoin/blob/master/ch08.asciidoc) - Bare Multisig • Coding OP_CHECKMULTISIG • Problems with Bare Multisig • Pay-to-Script-Hash (p2sh) • Coding p2sh • Conclusion


Talk Notes

- [Contracts, Contracts, Contracts - Code Your Own (Crypto Blockchain) Contracts w/ Ruby (sruby), Universum & Co](https://github.com/geraldb/talks/blob/master/contracts.md)
  - Genesis - Bitcoin Script
    - Ivy - Higher-Level Bitcoin Script
    - History Corner - Bitcoin - The World's Worst Database for Everything? - Bitcoin Maximalism in Action
  - Turing Complete and the Halting Problem
    - Fees, Fees, Fees - $$$ - There's No Free Lunch



## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The Programming Bitcoin Script Step-by-Step book / guide
is dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
