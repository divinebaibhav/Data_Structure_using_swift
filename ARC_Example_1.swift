/*
According to ARC memory management object with at least one strong reference will not be free/deallocated.

*/

class Tutorial {
    
    init() {
        print ("Tutorial initialized")
    }
    deinit {
        print ("Tutorial deinitialized")
    }
}

var t:Tutorial? =  Tutorial() //default strong ref
t = nil

/*
Output:
Tutorial initialized
Tutorial deinitialized
*/

/* ------------------------------------------------------*/

class Tutorial {
    
    init() {
        print ("Tutorial initialized")
    }
    deinit {
        print ("Tutorial deinitialized")
    }
}

var t:Tutorial? =  Tutorial()
var ref:Tutorial?
ref = t
t = nil

/*
Output:
Tutorial initialized
*/
/* ------------------------------------------------------*/

class Tutorial {
    
    init() {
        print ("Tutorial initialized")
    }
    deinit {
        print ("Tutorial deinitialized")
    }
}

var t:Tutorial? =  Tutorial()
var ref:Tutorial?
ref = t
t = nil
ref = nil

/*
Output:
Tutorial initialized
Tutorial deinitialized

*/
