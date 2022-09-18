/*
A weak reference is a reference that does not keep a strong hold on the instance it refers to and
so does not stop ARC from deallocating the referenced instance. Can be nil. so always optional, if let , guard can be used

An unowned reference does not keep a strong hold on the instance it refers to.
however, an unowned reference is used when the other instance has the same lifetime or a longer lifetime.

“weak reference is used where there is possibility for that reference to become nil at some point during its lifetime. 
an unowned reference is used where there is no possibility for that reference becoming nil at any point until the self-object exist”
*/


/*
Accounts and Pricing Plans:
If you sign up for Netflix, you choose a pricing plan. 
You create an account and you choose the pricing plan that fits your needs. This is what that could look like in code.
*/

class Account {

    // MARK: - Properties

    var plan: Plan?
    var aid: Int
    
    init(id: Int){
        aid = id
        print("\(aid) is being initialized")

    }
    
         deinit {
          print("\(aid) is being deinitialized")
     }

}

class Plan {

    // MARK: - Properties

    var account: Account?
    var price: Int
    // MARK: - Initialization

    init(p: Int) {
        self.price = p
        print("\(price) is being initialized")

    }
      deinit {
          print("\(price) is being deinitialized")
     }

}

var acc:Account? =  Account(id: 1)
var plan: Plan?  = Plan(p: 100)
acc = nil
plan = nil
/*
Output
1 is being initialized
100 is being initialized
1 is being deinitialized
100 is being deinitialized
*/

/***********************************************/

class Account {

    // MARK: - Properties

    var plan: Plan?
    var aid: Int
    
    init(id: Int){
        aid = id
        print("\(aid) is being initialized")

    }
    
         deinit {
          print("\(aid) is being deinitialized")
     }

}

class Plan {

    // MARK: - Properties

    var account: Account?
    var price: Int
    // MARK: - Initialization

    init(p: Int) {
        self.price = p
        print("\(price) is being initialized")

    }
      deinit {
          print("\(price) is being deinitialized")
     }

}

var acc:Account? =  Account(id: 1)
var plan: Plan?  = Plan(p: 100)

acc?.plan = plan 
plan?.account = acc

acc = nil
plan = nil

/*
Output:
1 is being initialized
100 is being initialized

*/

//In the example, we created a strong reference cycle.
//An account instance keeps a strong reference to a plan and the plan of the account keeps a strong reference to the account it is linked to. 
//Remember that properties are by default strong.

//=> We can break the strong reference cycle by marking the account property of the Plan class as unowned.
/*
Soultion
An account should always have a plan associated with it and a plan shouldn't exist without an account.
 An unowned reference is always expected to have a value. When the Account instance is deallocated, the Plan instance it is linked to is also deallocated.
This is only possible because the account property is marked as unowned instead of strong, which is the default for properties.
*/

class Account {

    // MARK: - Properties

    var plan: Plan?
    var aid: Int
    
    init(id: Int){
        aid = id
        print("\(aid) is being initialized")

    }
    
         deinit {
          print("\(aid) is being deinitialized")
     }

}

class Plan {

    // MARK: - Properties
 /*
 Here account cant weak means optional . it always have account. so use unowned
 
 */
    unowned var account: Account?
    var price: Int
    // MARK: - Initialization

    init(p: Int) {
        self.price = p
        print("\(price) is being initialized")

    }
      deinit {
          print("\(price) is being deinitialized")
     }

}

var acc:Account? =  Account(id: 1)
var plan: Plan?  = Plan(p: 100)

acc?.plan = plan 
plan?.account = acc

acc = nil
plan = nil

/*
Output
1 is being initialized
100 is being initialized
1 is being deinitialized
100 is being deinitialized

*/
