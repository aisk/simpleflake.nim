import unittest

import simpleflake

test "can generate simpleflake id":
  check gen() > uint64(5432510521311235617)

test "can parse simpleflake id":
  let parsed = simpleflake.parse(5432510521311235617u64)
  check parsed.timestamp == 1594308519.7220001
  check parsed.randomBits == 5508641
