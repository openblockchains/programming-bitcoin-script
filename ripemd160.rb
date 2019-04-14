## RIPEMD (RIPE Message Digest)
##
## see https://en.wikipedia.org/wiki/RIPEMD

require 'pp'
require 'digest'  # Hash (Digest) Functions


def ripemd160( message )
  Digest::RMD160.hexdigest( message )
end

pp ripemd160( "The quick brown fox jumps over the lazy dog" )
#=> "37f332f68db77bd9d7edd4969571ad671cf9dd3b"

pp ripemd160( "The quick brown fox jumps over the lazy cog" )
#=> "132072df690933835eb8b6ad0b77e7b6f14acad7"

# The hash of a zero-length string is:
pp ripemd160( "" )
#=> "9c1185a5c5e9fc54612808977ee8f548b2258d31"
