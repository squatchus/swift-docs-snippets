# Memory Safety
* [Memory Safety](../master/chapters/MemorySafety.md#memory-safety)
* [ - Understanding Conflicting Access to Memory](../master/chapters/MemorySafety.md#understanding-conflicting-access-to-memory)
* [ - - Characteristics of Memory Access](../chapters/MemorySafety.md#characteristics-of-memory-access)
* [ - Conflicting Access to In-Out Parameters](../master/chapters/MemorySafety.md#conflicting-access-to-in-out-parameters)
* [ - Conflicting Access to self in Methods](../master/chapters/MemorySafety.md#conflicting-access-to-self-in-methods)
* [ - Conflicting Access to Properties](../master/chapters/MemorySafety.md#conflicting-access-to-properties)

# Memory Safety

## Understanding Conflicting Access to Memory

```Swift
// A write access to the memory where one is stored.
var one = 1

// A read access from the memory where one is stored.
print("We're number \(one)!")
```

### Characteristics of Memory Access

```Swift
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)
// Prints "2"
```

## Conflicting Access to In-Out Parameters

```Swift
var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

increment(&stepSize)
// Error: conflicting accesses to stepSize
```

```Swift
// Make an explicit copy.
var copyOfStepSize = stepSize
increment(&copyOfStepSize)

// Update the original.
stepSize = copyOfStepSize
// stepSize is now 2
```

```Swift
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // OK
balance(&playerOneScore, &playerOneScore)
// Error: conflicting accesses to playerOneScore
```

## Conflicting Access to self in Methods

```Swift
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
```

```Swift
extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // OK
```

```Swift
oscar.shareHealth(with: &oscar)
// Error: conflicting accesses to oscar
```

## Conflicting Access to Properties

```Swift
var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)
// Error: conflicting access to properties of playerInformation
```

```Swift
var holly = Player(name: "Holly", health: 10, energy: 10)
balance(&holly.health, &holly.energy)  // Error
```

```Swift
func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // OK
}
```

