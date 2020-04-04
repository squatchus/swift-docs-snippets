# Advanced Operators
* [Advanced Operators](../master/chapters/AdvancedOperators.md#advanced-operators)
[ - Bitwise Operators](../master/chapters/AdvancedOperators.md#bitwise-operators)
[ - - Bitwise NOT Operator](../chapters/AdvancedOperators.md#bitwise-not-operator)
[ - - Bitwise AND Operator](../chapters/AdvancedOperators.md#bitwise-and-operator)
[ - - Bitwise OR Operator](../chapters/AdvancedOperators.md#bitwise-or-operator)
[ - - Bitwise XOR Operator](../chapters/AdvancedOperators.md#bitwise-xor-operator)
[ - - Bitwise Left and Right Shift Operators](../chapters/AdvancedOperators.md#bitwise-left-and-right-shift-operators)
[ - Overflow Operators](../master/chapters/AdvancedOperators.md#overflow-operators)
[ - - Value Overflow](../chapters/AdvancedOperators.md#value-overflow)
[ - Precedence and Associativity](../master/chapters/AdvancedOperators.md#precedence-and-associativity)
[ - Operator Methods](../master/chapters/AdvancedOperators.md#operator-methods)
[ - - Prefix and Postfix Operators](../chapters/AdvancedOperators.md#prefix-and-postfix-operators)
[ - - Compound Assignment Operators](../chapters/AdvancedOperators.md#compound-assignment-operators)
[ - - Equivalence Operators](../chapters/AdvancedOperators.md#equivalence-operators)
[ - Custom Operators](../master/chapters/AdvancedOperators.md#custom-operators)
[ - - Precedence for Custom Infix Operators](../chapters/AdvancedOperators.md#precedence-for-custom-infix-operators)

# Advanced Operators

## Bitwise Operators

### Bitwise NOT Operator

```Swift
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // equals 11110000
```

### Bitwise AND Operator

```Swift
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
```

### Bitwise OR Operator

```Swift
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110
```

### Bitwise XOR Operator

```Swift
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001
```

### Bitwise Left and Right Shift Operators

```Swift
let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001
```

```Swift
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153
```

## Overflow Operators

```Swift
var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
potentialOverflow += 1
// this causes an error
```

### Value Overflow

```Swift
var unsignedOverflow = UInt8.max
// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsignedOverflow is now equal to 0
```

```Swift
var unsignedOverflow = UInt8.min
// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &- 1
// unsignedOverflow is now equal to 255
```

```Swift
var signedOverflow = Int8.min
// signedOverflow equals -128, which is the minimum value an Int8 can hold
signedOverflow = signedOverflow &- 1
// signedOverflow is now equal to 127
```

## Precedence and Associativity

```Swift
2 + 3 % 4 * 5
// this equals 17
```

```Swift
2 + ((3 % 4) * 5)
```

```Swift
2 + (3 * 5)
```

```Swift
2 + 15
```

## Operator Methods

```Swift
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
```

```Swift
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector is a Vector2D instance with values of (5.0, 5.0)
```

### Prefix and Postfix Operators

```Swift
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
```

```Swift
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative is a Vector2D instance with values of (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive is a Vector2D instance with values of (3.0, 4.0)
```

### Compound Assignment Operators

```Swift
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
```

```Swift
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original now has values of (4.0, 6.0)
```

### Equivalence Operators

```Swift
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}
```

```Swift
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
// Prints "These two vectors are equivalent."
```

```Swift
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}
// Prints "These two vectors are also equivalent."
```

## Custom Operators

```Swift
prefix operator +++
```

```Swift
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)
```

### Precedence for Custom Infix Operators

```Swift
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)
```

