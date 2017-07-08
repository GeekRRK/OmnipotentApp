var `var` = "keyword surround within backticks"

// print(_:separator:terminator:)
print("someValue", terminator: "")

// Nested multiline comments enable you to comment out large blocks of code quickly and easily, even if the code already contains multiline comments.

let cat = "🐱"; print(cat)

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

/*
 Double represents a 64-bit floating-point number.
 Float represents a 32-bit floating-point number.
 Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits. The appropriate floating-point type to use depends on the nature and range of values you need to work with in your code. In situations where either type would be appropriate, Double is preferred.
 */

/*
 Integer literals can be written as:
 
 A decimal number, with no prefix
 A binary number, with a 0b prefix
 An octal number, with a 0o prefix
 A hexadecimal number, with a 0x prefix
 */

/*
 Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e; hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p.
 
 For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:
 
 1.25e2 means 1.25 x 102, or 125.0.
 1.25e-2 means 1.25 x 10-2, or 0.0125.
 For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp:
 
 0xFp2 means 15 x 22, or 60.0.
 0xFp-2 means 15 x 2-2, or 3.75.
 */

/*
 Numeric literals can contain extra formatting to make them easier to read. Both integers and floats can be padded with extra zeros and can contain underscores to help with readability. Neither type of formatting affects the underlying value of the literal:
 */
 let paddedDouble = 000123.456
 let oneMillion = 1_000_000
 let justOverOneMillion = 1_000_000.000_000_1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
/*
 SomeType(ofInitialValue) is the default way to call the initializer of a Swift type and pass in an initial value. Behind the scenes, UInt16 has an initializer that accepts a UInt8 value, and so this initializer is used to make a new UInt16 from an existing UInt8. You can’t pass in any type here, however—it has to be a type for which UInt16 provides an initializer. Extending existing types to provide initializers that accept new types (including your own type definitions) is covered in Extensions.
 */

// Conversions between integer and floating-point numeric types must be made explicit
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
/*
 The rules for combining numeric constants and variables are different from the rules for numeric literals. The literal value 3 can be added directly to the literal value 0.14159, because number literals do not have an explicit type in and of themselves. Their type is inferred only at the point that they are evaluated by the compiler.
 */

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// The values within a tuple can be of any type and do not have to be of the same type as each other.
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

// You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// Because the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int. The question mark indicates that the value it contains is optional, meaning that it might contain some Int value, or it might contain no value at all.

var serverResponseCode: Int? = 404
serverResponseCode = nil
// nil cannot be used with nonoptional constants and variables.

// If you define an optional variable without providing a default value, the variable is automatically set to nil for you:
var surveyAnswer: String?

// Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.

// You can use an if statement to find out whether an optional contains a value by comparing the optional against nil. You perform this comparison with the “equal to” operator (==) or the “not equal to” operator (!=).
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

// You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
if let actualNumber = Int(possibleNumber) {
    // It has already been initialized with the value contained within the optional, and so there is no need to use the ! suffix to access its value.
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}
// If you wanted to manipulate the value of actualNumber within the first branch of the if statement, you could write if var actualNumber instead

// You can include as many optional bindings and Boolean conditions in a single if statement as you need to, separated by commas. If any of the values in the optional bindings are nil or any Boolean condition evaluates to false, the whole if statement’s condition is considered to be false.
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// Constants and variables created with optional binding in an if statement are available only within the body of the if statement. In contrast, the constants and variables created with a guard statement are available in the lines of code that follow the guard statement, as described in Early Exit.

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

func canThrowAnError() throws {
    // this function may or may not throw an error
}
// A function indicates that it can throw an error by including the throws keyword in its declaration. When you call a function that can throw an error, you prepend the try keyword to the expression.
// Swift automatically propagates errors out of their current scope until they are handled by a catch clause.
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

// Assertions help you find mistakes and incorrect assumptions during development, and preconditions help you detect issues in production.
// The difference between assertions and preconditions is in when they are checked: Assertions are checked only in debug builds, but preconditions are checked in both debug and production builds. In production builds, the condition inside an assertion isn’t evaluated. This means you can use as many assertions as you want during your development process, without impacting the performance in production.

// assert(_:_:file:line:)
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")

// If the code already checks the condition, you use the assertionFailure(_:file:line:) function to indicate that an assertion has failed. For example:
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

// Use a precondition whenever a condition has the potential to be false, but must definitely be true for your code to continue execution. For example, use a precondition to check that a subscript is not out of bounds, or to check that a function has been passed a valid value.
// precondition(_:_:file:line:)
let index = -1
precondition(index > 0, "Index must be greater than zero.")

// You can also call the preconditionFailure(_:file:line:) function to indicate that a failure has occurred—for example, if the default case of a switch was taken, but all valid input data should have been handled by one of the switch’s other cases.

// If you compile in unchecked mode (-Ounchecked), preconditions are not checked. The compiler assumes that preconditions are always true, and it optimizes your code accordingly. However, the fatalError(_:file:line:) function always halts execution, regardless of optimization settings.

// You can use the fatalError(_:file:line:) function during prototyping and early development to create stubs for functionality that hasn’t been implemented yet, by writing fatalError("Unimplemented") as the stub implementation. Because fatal errors are never optimized out, unlike assertions or preconditions, you can be sure that execution always halts if it encounters a stub implementation.
