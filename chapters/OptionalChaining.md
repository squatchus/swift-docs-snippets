# Optional Chaining
* [Optional Chaining](../master/chapters/OptionalChaining.md#optional-chaining)
[ - Optional Chaining as an Alternative to Forced Unwrapping](../master/chapters/OptionalChaining.md#optional-chaining-as-an-alternative-to-forced-unwrapping)
[ - Defining Model Classes for Optional Chaining](../master/chapters/OptionalChaining.md#defining-model-classes-for-optional-chaining)
[ - Accessing Properties Through Optional Chaining](../master/chapters/OptionalChaining.md#accessing-properties-through-optional-chaining)
[ - Calling Methods Through Optional Chaining](../master/chapters/OptionalChaining.md#calling-methods-through-optional-chaining)
[ - Accessing Subscripts Through Optional Chaining](../master/chapters/OptionalChaining.md#accessing-subscripts-through-optional-chaining)
[ - - Accessing Subscripts of Optional Type](../chapters/OptionalChaining.md#accessing-subscripts-of-optional-type)
[ - Linking Multiple Levels of Chaining](../master/chapters/OptionalChaining.md#linking-multiple-levels-of-chaining)
[ - Chaining on Methods with Optional Return Values](../master/chapters/OptionalChaining.md#chaining-on-methods-with-optional-return-values)

# Optional Chaining

## Optional Chaining as an Alternative to Forced Unwrapping

```Swift
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}
```

```Swift
let john = Person()
```

```Swift
let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error
```

```Swift
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."
```

```Swift
john.residence = Residence()
```

```Swift
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
```

## Defining Model Classes for Optional Chaining

```Swift
class Person {
    var residence: Residence?
}
```

```Swift
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
```

```Swift
class Room {
    let name: String
    init(name: String) { self.name = name }
}
```

```Swift
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
```

## Accessing Properties Through Optional Chaining

```Swift
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."
```

```Swift
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress
```

```Swift
func createAddress() -> Address {
    print("Function was called.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}
john.residence?.address = createAddress()
```

## Calling Methods Through Optional Chaining

```Swift
func printNumberOfRooms() {
    print("The number of rooms is \(numberOfRooms)")
}
```

```Swift
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// Prints "It was not possible to print the number of rooms."
```

```Swift
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// Prints "It was not possible to set the address."
```

## Accessing Subscripts Through Optional Chaining

```Swift
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "Unable to retrieve the first room name."
```

```Swift
john.residence?[0] = Room(name: "Bathroom")
```

```Swift
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."
```

### Accessing Subscripts of Optional Type

```Swift
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
```

## Linking Multiple Levels of Chaining

```Swift
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "Unable to retrieve the address."
```

```Swift
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "John's street name is Laurel Street."
```

## Chaining on Methods with Optional Return Values

```Swift
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// Prints "John's building identifier is The Larches."
```

```Swift
if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
// Prints "John's building identifier begins with "The"."
```

