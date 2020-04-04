# Subscripts
* [Subscripts](../master/chapters/Subscripts.md#subscripts)
[ - Subscript Syntax](../master/chapters/Subscripts.md#subscript-syntax)
[ - Subscript Usage](../master/chapters/Subscripts.md#subscript-usage)
[ - Subscript Options](../master/chapters/Subscripts.md#subscript-options)
[ - Type Subscripts](../master/chapters/Subscripts.md#type-subscripts)

# Subscripts

## Subscript Syntax

```Swift
subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}
```

```Swift
subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
}
```

```Swift
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"
```

## Subscript Usage

```Swift
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
```

## Subscript Options

```Swift
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
```

```Swift
var matrix = Matrix(rows: 2, columns: 2)
```

```Swift
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
```

```Swift
func indexIsValid(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
}
```

```Swift
let someValue = matrix[2, 2]
// This triggers an assert, because [2, 2] is outside of the matrix bounds.
```

## Type Subscripts

```Swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
```

