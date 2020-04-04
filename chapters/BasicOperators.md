# Basic Operators
* [Basic Operators](../master/chapters/BasicOperators.md#basic-operators)
* [ - Terminology](../master/chapters/BasicOperators.md#terminology)
* [ - Assignment Operator](../master/chapters/BasicOperators.md#assignment-operator)
* [ - Arithmetic Operators](../master/chapters/BasicOperators.md#arithmetic-operators)
* [ - - Remainder Operator](../chapters/BasicOperators.md#remainder-operator)
* [ - - Unary Minus Operator](../chapters/BasicOperators.md#unary-minus-operator)
* [ - - Unary Plus Operator](../chapters/BasicOperators.md#unary-plus-operator)
* [ - Compound Assignment Operators](../master/chapters/BasicOperators.md#compound-assignment-operators)
* [ - Comparison Operators](../master/chapters/BasicOperators.md#comparison-operators)
* [ - Ternary Conditional Operator](../master/chapters/BasicOperators.md#ternary-conditional-operator)
* [ - Nil-Coalescing Operator](../master/chapters/BasicOperators.md#nil-coalescing-operator)
* [ - Range Operators](../master/chapters/BasicOperators.md#range-operators)
* [ - - Closed Range Operator](../chapters/BasicOperators.md#closed-range-operator)
* [ - - Half-Open Range Operator](../chapters/BasicOperators.md#half-open-range-operator)
* [ - - One-Sided Ranges](../chapters/BasicOperators.md#one-sided-ranges)
* [ - Logical Operators](../master/chapters/BasicOperators.md#logical-operators)
* [ - - Logical NOT Operator](../chapters/BasicOperators.md#logical-not-operator)
* [ - - Logical AND Operator](../chapters/BasicOperators.md#logical-and-operator)
* [ - - Logical OR Operator](../chapters/BasicOperators.md#logical-or-operator)
* [ - - Combining Logical Operators](../chapters/BasicOperators.md#combining-logical-operators)
* [ - - Explicit Parentheses](../chapters/BasicOperators.md#explicit-parentheses)

# Basic Operators

## Terminology

## Assignment Operator

```Swift
let b = 10
var a = 5
a = b
// a is now equal to 10
```

```Swift
let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2
```

```Swift
if x = y {
    // This is not valid, because x = y does not return a value.
}
```

## Arithmetic Operators

```Swift
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0
```

```Swift
"hello, " + "world"  // equals "hello, world"
```

### Remainder Operator

```Swift
9 % 4    // equals 1
```

```Swift
-9 % 4   // equals -1
```

### Unary Minus Operator

```Swift
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
```

### Unary Plus Operator

```Swift
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
```

## Compound Assignment Operators

```Swift
var a = 1
a += 2
// a is now equal to 3
```

## Comparison Operators

```Swift
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1
```

```Swift
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".
```

```Swift
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
```

```Swift
("blue", -1) < ("purple", 1)        // OK, evaluates to true
("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
```

## Ternary Conditional Operator

```Swift
if question {
    answer1
} else {
    answer2
}
```

```Swift
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```

```Swift
let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
// rowHeight is equal to 90
```

## Nil-Coalescing Operator

```Swift
a != nil ? a! : b
```

```Swift
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

```Swift
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"
```

## Range Operators

### Closed Range Operator

```Swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

### Half-Open Range Operator

```Swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
```

### One-Sided Ranges

```Swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
```

```Swift
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
```

```Swift
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
```

## Logical Operators

### Logical NOT Operator

```Swift
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

### Logical AND Operator

```Swift
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"
```

### Logical OR Operator

```Swift
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

### Combining Logical Operators

```Swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

### Explicit Parentheses

```Swift
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"
```

