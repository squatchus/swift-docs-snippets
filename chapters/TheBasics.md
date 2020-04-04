# The Basics
* [The Basics](../master/chapters/TheBasics.md#the-basics)
[ - Constants and Variables](../master/chapters/TheBasics.md#constants-and-variables)
[ - - Declaring Constants and Variables](../chapters/TheBasics.md#declaring-constants-and-variables)
[ - - Type Annotations](../chapters/TheBasics.md#type-annotations)
[ - - Naming Constants and Variables](../chapters/TheBasics.md#naming-constants-and-variables)
[ - - Printing Constants and Variables](../chapters/TheBasics.md#printing-constants-and-variables)
[ - Comments](../master/chapters/TheBasics.md#comments)
[ - Semicolons](../master/chapters/TheBasics.md#semicolons)
[ - Integers](../master/chapters/TheBasics.md#integers)
[ - - Integer Bounds](../chapters/TheBasics.md#integer-bounds)
[ - - Int](../chapters/TheBasics.md#int)
[ - - UInt](../chapters/TheBasics.md#uint)
[ - Floating-Point Numbers](../master/chapters/TheBasics.md#floating-point-numbers)
[ - Type Safety and Type Inference](../master/chapters/TheBasics.md#type-safety-and-type-inference)
[ - Numeric Literals](../master/chapters/TheBasics.md#numeric-literals)
[ - Numeric Type Conversion](../master/chapters/TheBasics.md#numeric-type-conversion)
[ - - Integer Conversion](../chapters/TheBasics.md#integer-conversion)
[ - - Integer and Floating-Point Conversion](../chapters/TheBasics.md#integer-and-floating-point-conversion)
[ - Type Aliases](../master/chapters/TheBasics.md#type-aliases)
[ - Booleans](../master/chapters/TheBasics.md#booleans)
[ - Tuples](../master/chapters/TheBasics.md#tuples)
[ - Optionals](../master/chapters/TheBasics.md#optionals)
[ - - nil](../chapters/TheBasics.md#nil)
[ - - If Statements and Forced Unwrapping](../chapters/TheBasics.md#if-statements-and-forced-unwrapping)
[ - - Optional Binding](../chapters/TheBasics.md#optional-binding)
[ - - Implicitly Unwrapped Optionals](../chapters/TheBasics.md#implicitly-unwrapped-optionals)
[ - Error Handling](../master/chapters/TheBasics.md#error-handling)
[ - Assertions and Preconditions](../master/chapters/TheBasics.md#assertions-and-preconditions)
[ - - Debugging with Assertions](../chapters/TheBasics.md#debugging-with-assertions)
[ - - Enforcing Preconditions](../chapters/TheBasics.md#enforcing-preconditions)

# The Basics

## Constants and Variables

### Declaring Constants and Variables

```Swift
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
```

```Swift
var x = 0.0, y = 0.0, z = 0.0
```

### Type Annotations

```Swift
var welcomeMessage: String
```

```Swift
welcomeMessage = "Hello"
```

```Swift
var red, green, blue: Double
```

### Naming Constants and Variables

```Swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
```

```Swift
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"
```

```Swift
let languageName = "Swift"
languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.
```

### Printing Constants and Variables

```Swift
print(friendlyWelcome)
// Prints "Bonjour!"
```

```Swift
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"
```

## Comments

```Swift
// This is a comment.
```

```Swift
/* This is also a comment
but is written over multiple lines. */
```

```Swift
/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */
```

## Semicolons

```Swift
let cat = "🐱"; print(cat)
// Prints "🐱"
```

## Integers

### Integer Bounds

```Swift
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
```

### Int

### UInt

## Floating-Point Numbers

## Type Safety and Type Inference

```Swift
let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int
```

```Swift
let pi = 3.14159
// pi is inferred to be of type Double
```

```Swift
let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double
```

## Numeric Literals

```Swift
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
```

```Swift
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
```

```Swift
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```

## Numeric Type Conversion

### Integer Conversion

```Swift
let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error
```

```Swift
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
```

### Integer and Floating-Point Conversion

```Swift
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double
```

```Swift
let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int
```

## Type Aliases

```Swift
typealias AudioSample = UInt16
```

```Swift
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0
```

## Booleans

```Swift
let orangesAreOrange = true
let turnipsAreDelicious = false
```

```Swift
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."
```

```Swift
let i = 1
if i {
    // this example will not compile, and will report an error
}
```

```Swift
let i = 1
if i == 1 {
    // this example will compile successfully
}
```

## Tuples

```Swift
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
```

```Swift
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"
```

```Swift
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"
```

```Swift
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"
```

```Swift
let http200Status = (statusCode: 200, description: "OK")
```

```Swift
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"
```

## Optionals

```Swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"
```

### nil

```Swift
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
```

```Swift
var surveyAnswer: String?
// surveyAnswer is automatically set to nil
```

### If Statements and Forced Unwrapping

```Swift
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."
```

```Swift
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."
```

### Optional Binding

```Swift
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"
```

```Swift
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"
```

### Implicitly Unwrapped Optionals

```Swift
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point
```

```Swift
let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.
```

```Swift
if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicitly unwrapped optional string."
```

```Swift
if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."
```

## Error Handling

```Swift
func canThrowAnError() throws {
    // this function may or may not throw an error
}
```

```Swift
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
```

```Swift
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
```

## Assertions and Preconditions

### Debugging with Assertions

```Swift
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 is not >= 0.
```

```Swift
assert(age >= 0)
```

```Swift
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
```

### Enforcing Preconditions

```Swift
// In the implementation of a subscript...
precondition(index > 0, "Index must be greater than zero.")
```

