# Structures and Classes
* [Structures and Classes](../master/chapters/ClassesAndStructures.md#structures-and-classes)
* [ - Comparing Structures and Classes](../master/chapters/ClassesAndStructures.md#comparing-structures-and-classes)
* [ - - Definition Syntax](../chapters/ClassesAndStructures.md#definition-syntax)
* [ - - Structure and Class Instances](../chapters/ClassesAndStructures.md#structure-and-class-instances)
* [ - - Accessing Properties](../chapters/ClassesAndStructures.md#accessing-properties)
* [ - - Memberwise Initializers for Structure Types](../chapters/ClassesAndStructures.md#memberwise-initializers-for-structure-types)
* [ - Structures and Enumerations Are Value Types](../master/chapters/ClassesAndStructures.md#structures-and-enumerations-are-value-types)
* [ - Classes Are Reference Types](../master/chapters/ClassesAndStructures.md#classes-are-reference-types)
* [ - - Identity Operators](../chapters/ClassesAndStructures.md#identity-operators)
* [ - - Pointers](../chapters/ClassesAndStructures.md#pointers)

# Structures and Classes

## Comparing Structures and Classes

### Definition Syntax

```Swift
struct SomeStructure {
    // structure definition goes here
}
class SomeClass {
    // class definition goes here
}
```

```Swift
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```

### Structure and Class Instances

```Swift
let someResolution = Resolution()
let someVideoMode = VideoMode()
```

### Accessing Properties

```Swift
print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"
```

```Swift
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"
```

```Swift
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"
```

### Memberwise Initializers for Structure Types

```Swift
let vga = Resolution(width: 640, height: 480)
```

## Structures and Enumerations Are Value Types

```Swift
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
```

```Swift
cinema.width = 2048
```

```Swift
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"
```

```Swift
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"
```

```Swift
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
// Prints "The current direction is north"
// Prints "The remembered direction is west"
```

## Classes Are Reference Types

```Swift
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
```

```Swift
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
```

```Swift
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"
```

### Identity Operators

```Swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
```

### Pointers

