# Enumerations
* [Enumerations](../master/chapters/Enumerations.md#enumerations)
* [ - Enumeration Syntax](../master/chapters/Enumerations.md#enumeration-syntax)
* [ - Matching Enumeration Values with a Switch Statement](../master/chapters/Enumerations.md#matching-enumeration-values-with-a-switch-statement)
* [ - Iterating over Enumeration Cases](../master/chapters/Enumerations.md#iterating-over-enumeration-cases)
* [ - Associated Values](../master/chapters/Enumerations.md#associated-values)
* [ - Raw Values](../master/chapters/Enumerations.md#raw-values)
* [ - - Implicitly Assigned Raw Values](../chapters/Enumerations.md#implicitly-assigned-raw-values)
* [ - - Initializing from a Raw Value](../chapters/Enumerations.md#initializing-from-a-raw-value)
* [ - Recursive Enumerations](../master/chapters/Enumerations.md#recursive-enumerations)

# Enumerations

## Enumeration Syntax

```Swift
enum SomeEnumeration {
    // enumeration definition goes here
}
```

```Swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}
```

```Swift
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```

```Swift
var directionToHead = CompassPoint.west
```

```Swift
directionToHead = .east
```

## Matching Enumeration Values with a Switch Statement

```Swift
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"
```

```Swift
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"
```

## Iterating over Enumeration Cases

```Swift
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"
```

```Swift
for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
```

## Associated Values

```Swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

```Swift
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
```

```Swift
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
```

```Swift
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."
```

```Swift
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."
```

## Raw Values

```Swift
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```

### Implicitly Assigned Raw Values

```Swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```

```Swift
enum CompassPoint: String {
    case north, south, east, west
}
```

```Swift
let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"
```

### Initializing from a Raw Value

```Swift
let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus
```

```Swift
let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"
```

## Recursive Enumerations

```Swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

```Swift
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

```Swift
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
```

```Swift
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// Prints "18"
```

