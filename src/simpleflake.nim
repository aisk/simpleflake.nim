import math
import random
import times

const SIMPLEFLAKE_EPOCH = 946702800
const SIMPLEFLAKE_RANDOM_LENGTH = 23

random.randomize()

proc gen*(): uint64 =
  let now = times.getTime().toUnixFloat()
  var ts = uint64((now - SIMPLEFLAKE_EPOCH) * 1000)
  let randomBits = uint64(random.rand(2 ^ SIMPLEFLAKE_RANDOM_LENGTH))

  return ts shl SIMPLEFLAKE_RANDOM_LENGTH or randomBits