import math
import random
import times

const SIMPLEFLAKE_EPOCH = 946702800
const SIMPLEFLAKE_RANDOM_LENGTH = 23
const SIMPLEFLAKE_TIMESTAMP_LENGTH = 41

let now = times.getTime()
var rand = random.initRand(now.toUnix * 1_000_000_000 + now.nanosecond)

proc gen*(): uint64 =
  let now = times.getTime().toUnixFloat()
  let ts = uint64((now - SIMPLEFLAKE_EPOCH) * 1000)
  let randomBits = uint64(rand.rand(2 ^ SIMPLEFLAKE_RANDOM_LENGTH))
  return ts shl SIMPLEFLAKE_RANDOM_LENGTH or randomBits

proc parse*(flake: uint64): tuple[timestamp: float, randomBits: uint64] =
  let timestamp: float = float(flake shr SIMPLEFLAKE_RANDOM_LENGTH) / 1000 + SIMPLEFLAKE_EPOCH
  let bitmask = (1u64 shl SIMPLEFLAKE_RANDOM_LENGTH) - 1
  let randomBits: uint64 = flake and bitmask
  return (timestamp: timestamp, randomBits: randomBits)
