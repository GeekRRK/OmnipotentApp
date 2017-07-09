let (x, y) = (1, 2)

// Unlike the assignment operator in C and Objective-C, the assignment operator in Swift does not itself return a value.
/*
if x = y {
    // This is not valid, because x = y does not return a value.
}
 */

// Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators do not allow values to overflow by default. You can opt in to value overflow behavior by using Swift’s overflow operators (such as a &+ b). See Overflow Operators.

// "hello, " + "world"  // equals "hello, world"

let a = -9 % 5

// The remainder operator (%) is also known as a modulo operator in other languages. However, its behavior in Swift for negative numbers means that it is, strictly speaking, a remainder rather than a modulo operation.

// To determine the answer for a % b, the % operator calculates the following equation and returns remainder as its output:
// a = (b x some multiplier) + remainder
// The sign of b is ignored for negative values of b. This means that a % b and a % -b always give the same answer.

// The compound assignment operators do not return a value. For example, you cannot write let b = a += 2.

// Swift also provides two identity operators (=== and !==), which you use to test whether two object references both refer to the same object instance.

// You can also compare tuples that have the same number of values, as long as each of the values in the tuple can be compared. For example, both Int and String can be compared, which means tuples of the type (Int, String) can be compared. In contrast, Bool can’t be compared, which means tuples that contain a Boolean value can’t be compared.

// Tuples are compared from left to right, one value at a time, until the comparison finds two values that aren’t equal. Those two values are compared, and the result of that comparison determines the overall result of the tuple comparison. If all the elements are equal, then the tuples themselves are equal. For example:
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

// The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements. To compare tuples with seven or more elements, you must implement the comparison operators yourself.

// The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil. The expression a is always of an optional type. The expression b must match the type that is stored inside a.
// The nil-coalescing operator is shorthand for the code below:
// a != nil ? a! : b

// One-Sided Ranges
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

