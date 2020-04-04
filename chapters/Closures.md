# Closures
* [Closures](../master/chapters/Closures.md#closures)
[ - Closure Expressions](../master/chapters/Closures.md#closure-expressions)
[ - - The Sorted Method](../chapters/Closures.md#the-sorted-method)
[ - - Closure Expression Syntax](../chapters/Closures.md#closure-expression-syntax)
[ - - Inferring Type From Context](../chapters/Closures.md#inferring-type-from-context)
[ - - Implicit Returns from Single-Expression Closures](../chapters/Closures.md#implicit-returns-from-single-expression-closures)
[ - - Shorthand Argument Names](../chapters/Closures.md#shorthand-argument-names)
[ - - Operator Methods](../chapters/Closures.md#operator-methods)
[ - Trailing Closures](../master/chapters/Closures.md#trailing-closures)
[ - Capturing Values](../master/chapters/Closures.md#capturing-values)
[ - Closures Are Reference Types](../master/chapters/Closures.md#closures-are-reference-types)
[ - Escaping Closures](../master/chapters/Closures.md#escaping-closures)
[ - Autoclosures](../master/chapters/Closures.md#autoclosures)

# Closures

## Closure Expressions

### The Sorted Method

```Swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
```

```Swift
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```

### Closure Expression Syntax

```Swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
```

```Swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
```

### Inferring Type From Context

```Swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

### Implicit Returns from Single-Expression Closures

```Swift
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```

### Shorthand Argument Names

```Swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

### Operator Methods

```Swift
reversedNames = names.sorted(by: >)
```

## Trailing Closures

```Swift
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
```

```Swift
reversedNames = names.sorted() { $0 > $1 }
```

```Swift
reversedNames = names.sorted { $0 > $1 }
```

```Swift
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
```

```Swift
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]
```

## Capturing Values

```Swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```

```Swift
func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
}
```

```Swift
let incrementByTen = makeIncrementer(forIncrement: 10)
```

```Swift
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30
```

```Swift
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7
```

```Swift
incrementByTen()
// returns a value of 40
```

## Closures Are Reference Types

```Swift
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60
```

## Escaping Closures

```Swift
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```

```Swift
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"
```

## Autoclosures

```Swift
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"
```

```Swift
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"
```

```Swift
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"
```

```Swift
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
```

