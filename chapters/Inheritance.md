# Inheritance
* [Inheritance](../master/chapters/Inheritance.md#inheritance)
* [ - Defining a Base Class](../master/chapters/Inheritance.md#defining-a-base-class)
* [ - Subclassing](../master/chapters/Inheritance.md#subclassing)
* [ - Overriding](../master/chapters/Inheritance.md#overriding)
* [ - - Accessing Superclass Methods, Properties, and Subscripts](../chapters/Inheritance.md#accessing-superclass-methods-properties-and-subscripts)
* [ - - Overriding Methods](../chapters/Inheritance.md#overriding-methods)
* [ - - Overriding Properties](../chapters/Inheritance.md#overriding-properties)
* [ - Preventing Overrides](../master/chapters/Inheritance.md#preventing-overrides)

# Inheritance

## Defining a Base Class

```Swift
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
```

```Swift
let someVehicle = Vehicle()
```

```Swift
print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour
```

## Subclassing

```Swift
class SomeSubclass: SomeSuperclass {
    // subclass definition goes here
}
```

```Swift
class Bicycle: Vehicle {
    var hasBasket = false
}
```

```Swift
let bicycle = Bicycle()
bicycle.hasBasket = true
```

```Swift
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour
```

```Swift
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
```

```Swift
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour
```

## Overriding

### Accessing Superclass Methods, Properties, and Subscripts

### Overriding Methods

```Swift
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
```

```Swift
let train = Train()
train.makeNoise()
// Prints "Choo Choo"
```

### Overriding Properties

```Swift
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
```

```Swift
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3
```

```Swift
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
```

```Swift
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4
```

## Preventing Overrides

