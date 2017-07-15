// Arrays, sets, and dictionaries in Swift are always clear about the types of values and keys that they can store. This means that you cannot insert a value of the wrong type into a collection by mistake. It also means you can be confident about the type of values you will retrieve from a collection.

// The type of a Swift array is written in full as Array<Element>, where Element is the type of values the array is allowed to store. You can also write the type of an array in shorthand form as [Element].

var someInts = [Int]()
someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Eggs", "Milk"]
// You don’t have to write the type of the array if you’re initializing it with an array literal containing values of the same type. The initialization of shoppingList could have been written in a shorter form instead:
// var shoppingList = ["Eggs", "Milk"]

// You access and modify an array through its methods and properties, or by using subscript syntax:
// .count   .isEmpty    append(_:)
shoppingList += ["Baking Powder"]

// You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing.
shoppingList[0...2] = ["Bananas", "Apples"]

shoppingList.insert("Maple Syrup", at: 0)

// This method removes the item at the specified index and returns the removed item.
let mapleSyrup = shoppingList.remove(at: 0)

// Like the remove(at:) method, removeLast() returns the removed item:
let apples = shoppingList.removeLast()

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, it follows that a.hashValue == b.hashValue.
// All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values are also hashable by default.

// You can use your own custom types as set value types or dictionary key types by making them conform to the Hashable protocol from Swift’s standard library. Types that conform to the Hashable protocol must provide a gettable Int property called hashValue. The value returned by a type’s hashValue property is not required to be the same across different executions of the same program, or in different programs.

// Because the Hashable protocol conforms to Equatable, conforming types must also provide an implementation of the equals operator (==). The Equatable protocol requires any conforming implementation of == to be an equivalence relation. That is, an implementation of == must satisfy the following three conditions, for all values a, b, and c:
// a == a (Reflexivity)
// a == b implies b == a (Symmetry)
// a == b && b == c implies a == c (Transitivity)`

// The type of a Swift set is written as Set<Element>, where Element is the type that the set is allowed to store. Unlike arrays, sets do not have an equivalent shorthand form.
var letters = Set<Character>()

//Alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty set with an empty array literal:
letters.insert("a")
letters = []

// You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set collection.
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

// A set type cannot be inferred from an array literal alone, so the type Set must be explicitly declared. However, because of Swift’s type inference, you don’t have to write the type of the set if you’re initializing it with an array literal containing values of the same type. The initialization of favoriteGenres could have been written in a shorter form instead:
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

// You access and modify a set through its methods and properties:
// .count  .isEmpty  insert(_:)  remove(_:)  contains(_:)  intersection(_:)  symmetricDifference(_:)  union(_:)  subtracting(_:)
// You can remove an item from a set by calling the set’s remove(_:) method, which removes the item if it’s a member of the set, and returns the removed value, or returns nil if the set did not contain it. Alternatively, all items in a set can be removed with its removeAll() method.

// Swift’s Set type does not have a defined ordering. To iterate over the values of a set in a specific order, use the sorted() method, which returns the set’s elements as an array sorted using the < operator.
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

/*
 Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
 Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
 Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
 Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
 Use the isDisjoint(with:) method to determine whether two sets have no values in common.
 */

// A dictionary Key type must conform to the Hashable protocol, like a set’s value type.
// The type of a Swift dictionary is written in full as Dictionary<Key, Value>. You can also write the type of a dictionary in shorthand form as [Key: Value].
var namesOfIntegers = [Int: String]()
// If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as [:] (a colon inside a pair of square brackets):
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// You don’t have to write the type of the dictionary if you’re initializing it with a dictionary literal whose keys and values have consistent types.
// var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// You access and modify a dictionary through its methods and properties, or by using subscript syntax:
// .count  .isEmpty
airports["LHR"] = "London" // Add
airports["LHR"] = "London Heathrow" // Change

// The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. For a dictionary that stores String values, for example, the method returns a value of type String?, or “optional String”. This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

// You can also use subscript syntax to retrieve a value from the dictionary for a particular key. Because it is possible to request a key for which no value exists, a dictionary’s subscript returns an optional value of the dictionary’s value type. If the dictionary contains a value for the requested key, the subscript returns an optional value containing the existing value for that key. Otherwise, the subscript returns nil:
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key:
airports["APL"] = "Apple International"
airports["APL"] = nil

// Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method. This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed:
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}


for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// Swift’s Dictionary type does not have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property.

