require 'pp'
require 'ecdsa'           # Use an elliptic curve library

# This private key is just an example. It should be much more secure!
privatekey = 1234

# Elliptic curve multiplication
group = ECDSA::Group::Secp256k1                          # Select the curve used in Bitcoin
point = group.generator.multiply_by_scalar( privatekey ) # Multiply by integer (not hex)

# Compressed format (even = 02, odd = 03)
#   Instead of using both x and y coordinates,
#   just use the x-coordinate and whether y is even/odd
prefix = point.y % 2 == 0 ? '02' : '03'

# Add the prefix to the x-coordinate
#   Convert to hex (and make sure it is 32 bytes / 64 characters in length)
pp pubkey = prefix + "%064x" % point.x
# => "02e37648435c60dcd181b3d41d50857ba5b5abebe279429aa76558f6653f1658f2"
