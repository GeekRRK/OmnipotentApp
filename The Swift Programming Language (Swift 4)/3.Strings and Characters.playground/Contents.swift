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






