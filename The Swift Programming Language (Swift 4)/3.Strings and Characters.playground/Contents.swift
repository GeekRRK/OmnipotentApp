let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

// Because the multiline form uses three double quotes instead of just one, you can include a double quote (") inside of a multiline string literal, as shown in the example above. To include a literal """ in a multiline string, you have to escape at least one of the quotation marks, using a backslash (\). For example:
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""

// A multiline string can be indented to match the surrounding code. The whitespace before the closing quotes (""") tells Swift what whitespace to ignore before all of the other lines. For example, even though the multiline string literal in the function below is indented, the lines in the actual string don’t begin with any whitespace.

func generateQuotation() -> String {
    let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.
        
        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
    return quotation
}
print(quotation == generateQuotation())

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here")
}

// You indicate whether a particular String can be modified (or mutated) by assigning it to a variable (in which case it can be modified), or to a constant (in which case it cannot be modified).
// This approach is different from string mutation in Objective-C and Cocoa, where you choose between two classes (NSString and NSMutableString) to indicate whether a string can be mutated.

// Swift’s String type is a value type. If you create a new String value, that String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version.

for character in "Dog!🐶" {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

var welcome = "hello" + " there"
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// You can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.

// The expressions you write inside parentheses within an interpolated string can’t contain an unescaped backslash (\), a carriage return, or a line feed. However, they can contain other string literals.

// Behind the scenes, Swift’s native String type is built from Unicode scalar values. A Unicode scalar is a unique 21-bit number for a character or modifier, such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").
// A Unicode scalar is any Unicode code point in the range U+0000 to U+D7FF inclusive or U+E000 to U+10FFFF inclusive. Unicode scalars do not include the Unicode surrogate pair code points, which are the code points in the range U+D800 to U+DFFF inclusive.
// Note that not all 21-bit Unicode scalars are assigned to a character—some scalars are reserved for future assignment. Scalars that have been assigned to a character typically also have a name, such as LATIN SMALL LETTER A and FRONT-FACING BABY CHICK in the examples above.

/*
 String literals can include the following special characters:
 The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quote) and \' (single quote)
 An arbitrary Unicode scalar, written as \u{n}, where n is a 1–8 digit hexadecimal number with a value equal to a valid Unicode code point
 */

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

// Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.count)")

// Extended grapheme clusters can be composed of multiple Unicode scalars. This means that different characters—and different representations of the same character—can require different amounts of memory to store. Because of this, characters in Swift do not each take up the same amount of memory within a string’s representation. As a result, the number of characters in a string cannot be calculated without iterating through the string to determine its extended grapheme cluster boundaries. If you are working with particularly long string values, be aware that the count property must iterate over the Unicode scalars in the entire string in order to determine the characters for that string.
// The count of the characters returned by the count property is not always the same as the length property of an NSString that contains the same characters. The length of an NSString is based on the number of 16-bit code units within the string’s UTF-16 representation and not the number of Unicode extended grapheme clusters within the string.

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

// You can use the startIndex and endIndex properties and the index(before:), index(after:), and index(_:offsetBy:) methods on any type that conforms to the Collection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))

welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)

// You can use the the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on any type that conforms to the RangeReplaceableCollection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.

// When you get a substring from a string—for example, using a subscript or a method like prefix(_:)—the result is an instance of Substring, not another string. Substrings in Swift have most of the same methods as strings, which means you can work with substrings like strings. Unlike strings, you use substrings for only a short amount of time while performing actions on a string. When you’re ready to store the result for a longer time, you convert the substring to an instance of String. For example:
let greeting2 = "Hello, world!"
let index2 = greeting2.index(of: ",") ?? greeting2.endIndex
let beginning = greeting2[..<index2]
let newString = String(beginning)

// Like strings, each substring has a region of memory where the characters that make up the substring are stored. The difference between strings and substrings is that, as a performance optimization, a substring can re-use part of the memory that’s used to store the original string, or part of the memory that’s used to store another substring. (Strings have a similar optimization, but if two strings share memory, they are equal.) This performance optimization means you don’t have to pay the performance cost of copying memory until you modify either the string or substring. As mentioned above, substrings aren’t suitable for long-term storage—because they re-use the storage of the original string, the entire original string must be kept in memory as long as any of its substrings are being used.
// In the example above, greeting is a string, which means it has a region of memory where the characters that make up the string are stored. Because beginning is a substring of greeting, it re-uses the memory that greeting uses. In contrast, newString is a string—when it’s created from the substring, it has its own storage.

// Both String and Substring conform to the StringProtocol protocol. If you’re writing code that manipulates string data, accepting a StringProtocol value lets you pass that string data as either a String or Substring value.

// Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they are composed from different Unicode scalars behind the scenes.
// For example, LATIN SMALL LETTER E WITH ACUTE (U+00E9) is canonically equivalent to LATIN SMALL LETTER E (U+0065) followed by COMBINING ACUTE ACCENT (U+0301). Both of these extended grapheme clusters are valid ways to represent the character é, and so they are considered to be canonically equivalent:
// Conversely, LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English, is not equivalent to CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian. The characters are visually similar, but do not have the same linguistic meaning:
// String and character comparisons in Swift are not locale-sensitive.

// The hasPrefix(_:) and hasSuffix(_:) methods perform a character-by-character canonical equivalence comparison between the extended grapheme clusters in each string.

print("")
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
