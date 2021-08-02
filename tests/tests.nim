import unittest

import simpleflake

test "can generate simpleflake id":
  check gen() > uint64(5432510521311235617)
