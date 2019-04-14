# compute Hash160(pubkey)

require 'pp'
require 'digest'                          # Hash (Digest) Functions

def hash160( pubkey )
  binary    = [pubkey].pack( "H*" )          # Convert to binary first before hashing
  sha256    = Digest::SHA256.digest( binary )
  ripemd160 = Digest::RMD160.digest( sha256 )
              ripemd160.unpack( "H*" )[0]    # Convert back to hex
end

pubkey              =  "02b4632d08485ff1df2db55b9dafd23347d1c47a457072a1e87be26896549a8737"
pp hash160( pubkey )  #=> "93ce48570b55c42c2af816aeaba06cfee1224fae"
