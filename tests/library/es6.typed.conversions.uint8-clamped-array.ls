{module, test} = QUnit
module \ES6
{Uint8Array, Uint8ClampedArray} = core
DESCRIPTORS and test 'Uint8ClampedArray conversions', !(assert)~>
  data = [
    [0,0,[0]]
    [-0,0,[0]]
    [1,1,[1]]
    [-1,0,[0]]
    [1.1,1,[1]]
    [-1.1,0,[0]]
    [1.9,2,[2]]
    [-1.9,0,[0]]
    [127,127,[127]]
    [-127,0,[0]]
    [128,128,[128]]
    [-128,0,[0]]
    [255,255,[255]]
    [-255,0,[0]]
    [255.1,255,[255]]
    [255.9,255,[255]]
    [256,255,[255]]
    [32767,255,[255]]
    [-32767,0,[0]]
    [32768,255,[255]]
    [-32768,0,[0]]
    [65535,255,[255]]
    [65536,255,[255]]
    [65537,255,[255]]
    [65536.54321,255,[255]]
    [-65536.54321,0,[0]]
    [2147483647,255,[255]]
    [-2147483647,0,[0]]
    [2147483648,255,[255]]
    [-2147483648,0,[0]]
    [2147483649,255,[255]]
    [-2147483649,0,[0]]
    [4294967295,255,[255]]
    [4294967296,255,[255]]
    [4294967297,255,[255]]
    [Infinity,255,[255]]
    [-Infinity,0,[0]]
    [-1.7976931348623157e+308,0,[0]]
    [1.7976931348623157e+308,255,[255]]
    [5e-324,0,[0]]
    [-5e-324,0,[0]]
    [NaN,0,[0]]
  ]

  typed = new Uint8ClampedArray 1
  z = -> if it is 0 and 1 / it is -Infinity => '-0' else it
  for it in data
    typed[0] = it[0]
    assert.same typed[0], it[1], "#{z it[0]} -> #{z it[1]}"
    assert.arrayEqual new Uint8Array(typed.buffer), (if LITTLE_ENDIAN => it[2] else it[2]reverse!), "#{z it[0]} -> #{it[2]}"