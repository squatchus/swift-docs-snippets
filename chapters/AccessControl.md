# Table of contents
* [Access Control](../chapters/AccessControl.md#access-control)
* [ - Modules and Source Files](../chapters/AccessControl.md#modules-and-source-files)
* [ - Access Levels](../chapters/AccessControl.md#access-levels)
* [ - - Guiding Principle of Access Levels](../chapters/AccessControl.md#guiding-principle-of-access-levels)
* [ - - Default Access Levels](../chapters/AccessControl.md#default-access-levels)
* [ - - Access Levels for Single-Target Apps](../chapters/AccessControl.md#access-levels-for-single-target-apps)
* [ - - Access Levels for Frameworks](../chapters/AccessControl.md#access-levels-for-frameworks)
* [ - - Access Levels for Unit Test Targets](../chapters/AccessControl.md#access-levels-for-unit-test-targets)
* [ - Access Control Syntax](../chapters/AccessControl.md#access-control-syntax)
* [ - Custom Types](../chapters/AccessControl.md#custom-types)
* [ - - Tuple Types](../chapters/AccessControl.md#tuple-types)
* [ - - Function Types](../chapters/AccessControl.md#function-types)
* [ - - Enumeration Types](../chapters/AccessControl.md#enumeration-types)
* [ - - Nested Types](../chapters/AccessControl.md#nested-types)
* [ - Subclassing](../chapters/AccessControl.md#subclassing)
* [ - Constants, Variables, Properties, and Subscripts](../chapters/AccessControl.md#constants-variables-properties-and-subscripts)
* [ - - Getters and Setters](../chapters/AccessControl.md#getters-and-setters)
* [ - Initializers](../chapters/AccessControl.md#initializers)
* [ - - Default Initializers](../chapters/AccessControl.md#default-initializers)
* [ - - Default Memberwise Initializers for Structure Types](../chapters/AccessControl.md#default-memberwise-initializers-for-structure-types)
* [ - Protocols](../chapters/AccessControl.md#protocols)
* [ - - Protocol Inheritance](../chapters/AccessControl.md#protocol-inheritance)
* [ - - Protocol Conformance](../chapters/AccessControl.md#protocol-conformance)
* [ - Extensions](../chapters/AccessControl.md#extensions)
* [ - - Private Members in Extensions](../chapters/AccessControl.md#private-members-in-extensions)
* [ - Generics](../chapters/AccessControl.md#generics)
* [ - Type Aliases](../chapters/AccessControl.md#type-aliases)

# Access Control

## Modules and Source Files

## Access Levels

### Guiding Principle of Access Levels

### Default Access Levels

### Access Levels for Single-Target Apps

### Access Levels for Frameworks

### Access Levels for Unit Test Targets

## Access Control Syntax

```Swift
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}
```

```Swift
class SomeInternalClass {}              // implicitly internal
let someInternalConstant = 0            // implicitly internal
```

## Custom Types

```Swift
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}
```

### Tuple Types

### Function Types

```Swift
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}
```

```Swift
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}
```

### Enumeration Types

```Swift
public enum CompassPoint {
    case north
    case south
    case east
    case west
}
```

### Nested Types

## Subclassing

```Swift
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}
```

```Swift
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}
```

## Constants, Variables, Properties, and Subscripts

```Swift
private var privateInstance = SomePrivateClass()
```

### Getters and Setters

```Swift
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
```

```Swift
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// Prints "The number of edits is 3"
```

```Swift
public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}
```

## Initializers

### Default Initializers

### Default Memberwise Initializers for Structure Types

## Protocols

### Protocol Inheritance

### Protocol Conformance

## Extensions

### Private Members in Extensions

```Swift
protocol SomeProtocol {
    func doSomething()
}
```

```Swift
struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}
```

## Generics

## Type Aliases

