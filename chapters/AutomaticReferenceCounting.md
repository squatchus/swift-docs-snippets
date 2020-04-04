# Table of contents
* [Automatic Reference Counting](../chapters/AutomaticReferenceCounting.md#automatic-reference-counting)
* [ - How ARC Works](../chapters/AutomaticReferenceCounting.md#how-arc-works)
* [ - ARC in Action](../chapters/AutomaticReferenceCounting.md#arc-in-action)
* [ - Strong Reference Cycles Between Class Instances](../chapters/AutomaticReferenceCounting.md#strong-reference-cycles-between-class-instances)
* [ - Resolving Strong Reference Cycles Between Class Instances](../chapters/AutomaticReferenceCounting.md#resolving-strong-reference-cycles-between-class-instances)
* [ - - Weak References](../chapters/AutomaticReferenceCounting.md#weak-references)
* [ - - Unowned References](../chapters/AutomaticReferenceCounting.md#unowned-references)
* [ - - Unowned References and Implicitly Unwrapped Optional Properties](../chapters/AutomaticReferenceCounting.md#unowned-references-and-implicitly-unwrapped-optional-properties)
* [ - Strong Reference Cycles for Closures](../chapters/AutomaticReferenceCounting.md#strong-reference-cycles-for-closures)
* [ - Resolving Strong Reference Cycles for Closures](../chapters/AutomaticReferenceCounting.md#resolving-strong-reference-cycles-for-closures)
* [ - - Defining a Capture List](../chapters/AutomaticReferenceCounting.md#defining-a-capture-list)
* [ - - Weak and Unowned References](../chapters/AutomaticReferenceCounting.md#weak-and-unowned-references)

# Automatic Reference Counting

## How ARC Works

## ARC in Action

```Swift
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
```

```Swift
var reference1: Person?
var reference2: Person?
var reference3: Person?
```

```Swift
reference1 = Person(name: "John Appleseed")
// Prints "John Appleseed is being initialized"
```

```Swift
reference2 = reference1
reference3 = reference1
```

```Swift
reference1 = nil
reference2 = nil
```

```Swift
reference3 = nil
// Prints "John Appleseed is being deinitialized"
```

## Strong Reference Cycles Between Class Instances

```Swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
```

```Swift
var john: Person?
var unit4A: Apartment?
```

```Swift
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
```

```Swift
john!.apartment = unit4A
unit4A!.tenant = john
```

```Swift
john = nil
unit4A = nil
```

## Resolving Strong Reference Cycles Between Class Instances

### Weak References

```Swift
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
```

```Swift
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
```

```Swift
john = nil
// Prints "John Appleseed is being deinitialized"
```

```Swift
unit4A = nil
// Prints "Apartment 4A is being deinitialized"
```

### Unowned References

```Swift
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
```

```Swift
var john: Customer?
```

```Swift
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
```

```Swift
john = nil
// Prints "John Appleseed is being deinitialized"
// Prints "Card #1234567890123456 is being deinitialized"
```

### Unowned References and Implicitly Unwrapped Optional Properties

```Swift
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
```

```Swift
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Canada's capital city is called Ottawa"
```

## Strong Reference Cycles for Closures

```Swift
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}
```

```Swift
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// Prints "<h1>some default text</h1>"
```

```Swift
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"
```

```Swift
paragraph = nil
```

## Resolving Strong Reference Cycles for Closures

### Defining a Capture List

```Swift
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate]
    (index: Int, stringToProcess: String) -> String in
    // closure body goes here
}
```

```Swift
lazy var someClosure = {
    [unowned self, weak delegate = self.delegate] in
    // closure body goes here
}
```

### Weak and Unowned References

```Swift
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}
```

```Swift
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"
```

```Swift
paragraph = nil
// Prints "p is being deinitialized"
```

