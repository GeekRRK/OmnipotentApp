/*
 Classes and structures in Swift have many things in common. Both can:
 Define properties to store values
 Define methods to provide functionality
 Define subscripts to provide access to their values using subscript syntax
 Define initializers to set up their initial state
 Be extended to expand their functionality beyond a default implementation
 Conform to protocols to provide standard functionality of a certain kind
 
 Classes have additional capabilities that structures do not:
 Inheritance enables one class to inherit the characteristics of another.
 Type casting enables you to check and interpret the type of a class instance at runtime.
 Deinitializers enable an instance of a class to free up any resources it has assigned.
 Reference counting allows more than one reference to a class instance.
 */

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let someVideoMode = VideoMode()
someVideoMode.resolution.width = 1280
// Unlike Objective-C, Swift enables you to set sub-properties of a structure property directly. In the last example above, the width property of the resolution property of someVideoMode is set directly, without your needing to set the entire resolution property to a new value.

// All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name:
let vga = Resolution(width: 640, height: 480)

// Unlike structures, class instances do not receive a default memberwise initializer.

// All of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.
// All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create—and any value types they have as properties—are always copied when they are passed around in your code.
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves do not actually change. tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes. It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.

// Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same is not true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
// It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:
// Identical to (===)
// Not identical to (!==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but is not a direct pointer to an address in memory.

/*
 As a general guideline, consider creating a structure when one or more of these conditions apply:
 The structure’s primary purpose is to encapsulate a few relatively simple data values.
 It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
 Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
 The structure does not need to inherit properties or behavior from another existing type.
 
 Examples of good candidates for structures include:
 The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
 A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
 A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.
 
 // In all other cases, define a class, and create instances of that class to be managed and passed by reference. In practice, this means that most custom data constructs should be classes, not structures.
 */






