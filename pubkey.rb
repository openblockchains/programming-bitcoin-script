require 'pp'
require 'ecdsa'           # Use an elliptic curve library

# This private key is just an example. It should be much more secure!
privatekey = 1234

# Elliptic curve multiplication
group = ECDSA::Group::Secp256k1                          # Select the curve used in Bitcoin
pp point = group.generator.multiply_by_scalar( privatekey ) # Multiply by integer (not hex)
#=> <ECDSA::Point: secp256k1,
#       0xe37648435c60dcd181b3d41d50857ba5b5abebe279429aa76558f6653f1658f2,
#       0x6d2ee9a82d4158f164ae653e9c6fa7f982ed8c94347fc05c2d068ff1d38b304c>

# Uncompressed format (with prefix 04)
#   Convert to 64 hexstring characters (32 bytes) in length
prefix = '04'
pp pubkey = prefix + "%064x" % point.x + "%064x" % point.y
#=> "04e37648435c60dcd181b3d41d50857ba5b5abebe279429aa76558f6653f1658f26d2ee9a82d4158f164ae653e9c6fa7f982ed8c94347fc05c2d068ff1d38b304c"

# Compressed format (with prefix - even = 02, odd = 03)
#   Instead of using both x and y coordinates,
#   just use the x-coordinate and whether y is even/odd
prefix = point.y % 2 == 0 ? '02' : '03'
pp pubkey = prefix + "%064x" % point.x
#=> "02e37648435c60dcd181b3d41d50857ba5b5abebe279429aa76558f6653f1658f2"
