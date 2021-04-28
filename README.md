# Swift Closures
Closures are self contained block of functionalities that can be passed around in your code.
1. sorted(by:) - this method take argument as a closure "(T, T) -> Bool" 

closure expression syntax

    { 
        (parameters) -> (return type) in
        (body)
    }

# Trailing closure
When you pass closure as a functions last argument.
 
     func someFunction(arg1: Type, closure: (parameters) -> closureReturn) { 
         // some code
      }
 
 eg:  
 
    func getElements(for id: Int, completion completionBlock: ([Int]) -> Void) { 
            // some logic
      }
            
    which will called as below

    getElements(for: 1) { (elements) in
       // handle logic
      }
 
 # Closure capture values that are passed to it
 suppose,
 
     let closures = { (val) in
        print("I like " + val)
    }

    func example() {
        var value = "Cats"
        closures(value)
        value = "Dogs"
    }

the output will print 'I like Cats'. Because closure captures the value passed to it, even if the value changes later. The closure will maintain the old value.


# Closures are reference types like functions
whenever you assign closure to variable or constant, you are holding closure as reference to the variable or constant.
In the example below, both var1 and var2 points to the same closure.

    let closure = { (val) in
         print(val)
    }
    let var1 = closure
    let var2 = var1
    
# Escaping Closures
We make a closure 'escaping' when we have passed a closure as a parameter to a function and it is called after the function has been returned. 
@escaping indicates closure is allowed to escape the dealloction of memory.

Best example is, if your blocks(B) have some asynchronous(A1) call inside them. And a function containing your block(B) returns before you get a call back from A1.

    class Person {
    var name: String?
    var address: String?
    func getUserInfo(closure: @escaping () -> Void) {
        let address = Address()
        address.findAddress { userAddress in
            self.address = userAddress
            closure()
        }
    }
    
    func setName() {
        self.getUserInfo { [weak self] in
            self?.name = "test"
        }
     }
    }
    class Address {
        func findAddress(completion: (String) -> Void) {
            completion("MagazinStrasse")
        }
    }

# closure assigned to variable 

    class Person {
    var name: String?
    var address: String?
    
    func getUserInfo(closure: @escaping () -> Void) {
        let address = Address()
        address.findAddress()
        address.completion = { userAddress in
            self.address = userAddress
            closure()
        }
    }
    
    func setName() {
        self.getUserInfo { [weak self] in
            self?.name = "test"
        }
    }
    }

    class Address {
    var completion: ((String) -> Void)?
    
    func findAddress() {
        completion?("MagazinStrasse")
    }
    }
    
 In class Address, I created a variable 'var completion: ((String) -> Void)?' and called it when I needed to return to the parent class.

# Strong reference cycles for closures
Strong reference cycles in closure occures because closures are reference types.
Below example creates a strong reference cycle using closure
     
     class Person {
           var name: String?
    
       func updateName(closure: () -> Void) {
            closure()
        }
    
        func setName() {
            self.updateName {
               self.name = "test"
            }
        }
    }
    // call
    let person = Person()
    person.setName()
    
 and you resolve this problem by introducing 'weak'
 
    func setName() {
        self.updateName { [weak self] in
            self?.name = "test"
        }
    }

 
