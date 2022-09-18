/*
Memory leak: A memory leak is a portion of memory that will never be used, yet is held onto forever. 
A memory leak reduces the performance of the computer by reducing the amount of available memory.

Retain Cycle: is the condition when 2 objects keep a reference to each other and are retained,
it creates a retain cycle since both objects try to retain each other and deallocation become impossible.

When an object’s reference count reaches zero, it will be released by the system and the memory used released to the system.
*/
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
    private var tutorial : Tutorial
    private var name : String
    init(tutorial: Tutorial, name: String) {
        print ("Tutorial initialized for student")
        self.tutorial = tutorial
        self.name = name
    }
    deinit {
        print ("Tutorial deinitialized")
    }
}

var computing : Tutorial? = Tutorial()
var dave : Student? = Student(tutorial: computing!, name: "Dave")
computing?.enroll(dave!)

computing = nil
dave = nil

/*
Output- 

Tutorial initialized
Tutorial initialized for student

*/
