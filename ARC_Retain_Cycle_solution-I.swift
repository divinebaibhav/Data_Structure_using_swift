/*
Differences between Value Types VS Reference Types

structures & enumerations : value typeswhich means copied data.
classes : Reference Type which means reference to a locationin the memory that stores the instance.

A value type is copied when it’s assigned to a variable or constant, or when it’s passed to a function.
All structures and enumerations are value types in Swift.Stored on Stack Memory

Reference types are not copied when are assigned to a variable or constant,
or they are passed to a function(like sharing the data / refer to the same existing instance is used).Stored on Managed Heap Memory
REF: https://medium.com/doyeona/structures-and-classes-in-swift-heap-stack-arc-e1ddfd0164b0

Solution for retail cycle -
1. Use struct: structs don’t have deinitializers is because they don’t need them: each struct has its own copy of its data,
2. Use a weak reference / (Weak or unowned)
*/

//Solution 1 by use of Struct: ARC doesn’t apply to struct in Swift. 

struct Tutorial {
    private var students = [Student]()
    mutating func enroll(_ student: Student) {
        students.append(student)
    }
}

struct Student {
    var tutorial : Tutorial
    var name : String
    init(tutorial: Tutorial, name: String) {
        self.tutorial = tutorial
        self.name = name
    }
}

var computing : Tutorial? = Tutorial()
var dave : Student? = Student(tutorial: computing!, name: "Dave")
computing?.enroll(dave!)

computing = nil
dave = nil

//OUtput: Memory deallocated as it points to nil

/********************************************************************************************/
//solution 2 by weak

class Tutorial {
    private var students = [Student]()
    func enroll(_ student: Student) {
        students.append(student)
    }
    init() {
        print ("Tutorial initialized")
    }
    deinit {
        print ("Tutorial deinitialized")
    }
}

class Student {
    weak var tutorial : Tutorial? = nil
    private var name : String
    init(tutorial: Tutorial, name: String) {
        print ("Student initialized")
        self.tutorial = tutorial
        self.name = name
    }
    deinit {
        self.tutorial = nil
        print ("Student deinitialized")
    }
}

var computing : Tutorial? = Tutorial()
var dave : Student? = Student(tutorial: computing!, name: "Dave")
computing?.enroll(dave!)
computing = nil
dave = nil

/*

Output:

Tutorial initialized
Student initialized
Tutorial deinitialized
Student deinitialized

*/

