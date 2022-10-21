import UIKit

// ARC
// Swift uses Automatic Reference Counting (ARC) to track and manage your app’s memory usage.
// ARC automatically frees up the memory. But not always!
//
// (!) Reference counting applies only to instances of classes.
// Structures and enumerations are value types, not reference types, and aren’t stored and passed by reference.

// How it works
// ..
// ARC tracks how many properties, constants, and variables are currently referring to each class instance.
// strong and weak reference (+-1)

class Item {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var item1: Item?
var item2: Item?
var item3: Item?

// nil = don't reference
//
//item1 = Item(name: "Item 1")
//item2 = Item(name: "Item 2")
//item3 = Item(name: "Item 3")
//
//item3 = nil

// Reference Cycles (memory leak)

class Person {
  let name: String
  var apartment: Apartment?
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) is being deinitialized")
  }
}

class Apartment {
  let unit: String
  weak var tenant: Person?
  init(unit: String) {
    self.unit = unit
  }
    
  deinit {
    print("Apartment \(unit) is being deinitialized")
  }
}

var person1: Person?
var unit1: Apartment?

person1 = Person(name: "Maria Ivanova")
unit1 = Apartment(unit: "Unit 1")

person1!.apartment = unit1
unit1!.tenant = person1

person1 = nil
unit1 = nil

// Solution: weak or unowned

// Weak - is used when the other instance has a shorter lifetime—that is, when the other instance can be deallocated first.

// ...


// Unowned - when the other instance has the same lifetime or a longer lifetime.
// (!) Unowned reference is expected to always have a value.

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
      print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) { // ensures that a CreditCard instance always has a customer instance associated with it when the CreditCard instance is created.
        self.number = number
        self.customer = customer
    }
    deinit {
      print("Card #\(number) is being deinitialized")
    }
}

var john: Customer?
john = Customer(name: "John")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)


john = nil
// with ARC, values are deallocated as soon as their last strong reference is removed
// garbage collector


