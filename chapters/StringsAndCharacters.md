# Table of contents
* [Strings and Characters](../chapters/StringsAndCharacters.md#strings-and-characters)
* [ - String Literals](../chapters/StringsAndCharacters.md#string-literals)
* [ - - Multiline String Literals](../chapters/StringsAndCharacters.md#multiline-string-literals)
* [ - - Special Characters in String Literals](../chapters/StringsAndCharacters.md#special-characters-in-string-literals)
* [ - - Extended String Delimiters](../chapters/StringsAndCharacters.md#extended-string-delimiters)
* [ - Initializing an Empty String](../chapters/StringsAndCharacters.md#initializing-an-empty-string)
* [ - String Mutability](../chapters/StringsAndCharacters.md#string-mutability)
* [ - Strings Are Value Types](../chapters/StringsAndCharacters.md#strings-are-value-types)
* [ - Working with Characters](../chapters/StringsAndCharacters.md#working-with-characters)
* [ - Concatenating Strings and Characters](../chapters/StringsAndCharacters.md#concatenating-strings-and-characters)
* [ - String Interpolation](../chapters/StringsAndCharacters.md#string-interpolation)
* [ - Unicode](../chapters/StringsAndCharacters.md#unicode)
* [ - - Unicode Scalar Values](../chapters/StringsAndCharacters.md#unicode-scalar-values)
* [ - - Extended Grapheme Clusters](../chapters/StringsAndCharacters.md#extended-grapheme-clusters)
* [ - Counting Characters](../chapters/StringsAndCharacters.md#counting-characters)
* [ - Accessing and Modifying a String](../chapters/StringsAndCharacters.md#accessing-and-modifying-a-string)
* [ - - String Indices](../chapters/StringsAndCharacters.md#string-indices)
* [ - - Inserting and Removing](../chapters/StringsAndCharacters.md#inserting-and-removing)
* [ - Substrings](../chapters/StringsAndCharacters.md#substrings)
* [ - Comparing Strings](../chapters/StringsAndCharacters.md#comparing-strings)
* [ - - String and Character Equality](../chapters/StringsAndCharacters.md#string-and-character-equality)
* [ - - Prefix and Suffix Equality](../chapters/StringsAndCharacters.md#prefix-and-suffix-equality)
* [ - Unicode Representations of Strings](../chapters/StringsAndCharacters.md#unicode-representations-of-strings)
* [ - - UTF-8 Representation](../chapters/StringsAndCharacters.md#utf-8-representation)
* [ - - UTF-16 Representation](../chapters/StringsAndCharacters.md#utf-16-representation)
* [ - - Unicode Scalar Representation](../chapters/StringsAndCharacters.md#unicode-scalar-representation)

# Strings and Characters

## String Literals

```Swift
let someString = "Some string literal value"
```

### Multiline String Literals

```Swift
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
```

```Swift
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
```

```Swift
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
```

```Swift
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
```

### Special Characters in String Literals

```Swift
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
```

```Swift
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
```

### Extended String Delimiters

```Swift
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
```

## Initializing an Empty String

```Swift
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
```

```Swift
if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"
```

## String Mutability

```Swift
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified
```

## Strings Are Value Types

## Working with Characters

```Swift
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶
```

```Swift
let exclamationMark: Character = "!"
```

```Swift
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"
```

## Concatenating Strings and Characters

```Swift
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"
```

```Swift
var instruction = "look over"
instruction += string2
// instruction now equals "look over there"
```

```Swift
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome now equals "hello there!"
```

```Swift
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// Prints two lines:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// Prints three lines:
// one
// two
// three
```

## String Interpolation

```Swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
```

```Swift
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."
```

```Swift
print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."
```

## Unicode

### Unicode Scalar Values

### Extended Grapheme Clusters

```Swift
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é
```

```Swift
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한
```

```Swift
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝
```

```Swift
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸
```

## Counting Characters

```Swift
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"
```

```Swift
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"
```

## Accessing and Modifying a String

### String Indices

```Swift
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
```

```Swift
greeting[greeting.endIndex] // Error
greeting.index(after: greeting.endIndex) // Error
```

```Swift
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "
```

### Inserting and Removing

```Swift
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"
```

```Swift
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
```

## Substrings

```Swift
let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
```

## Comparing Strings

### String and Character Equality

```Swift
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
```

```Swift
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"
```

```Swift
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."
```

### Prefix and Suffix Equality

```Swift
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
```

```Swift
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"
```

```Swift
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"
```

## Unicode Representations of Strings

```Swift
let dogString = "Dog‼🐶"
```

### UTF-8 Representation

```Swift
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "
```

### UTF-16 Representation

```Swift
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "
```

### Unicode Scalar Representation

```Swift
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "
```

```Swift
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶
```

