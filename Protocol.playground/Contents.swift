import UIKit

// protocol extensions, protocol inheritance, and protocol compositions
// value types can't be inherit. But can inherit protocol (now 2 classes)

//protocol CalcutationProtocol {
//	var value: Int { get }
//}

//func calculateValue(value: Int) -> Int {
//	value * 2
//}
//
//func calculateValue(type: CalcutationProtocol) -> Int {
//	type.value * 2
//}
//
//// let = { get }
//class SomeClass: CalcutationProtocol {
//	var value: Int = 10
//}
//
//struct SomeStruct: CalcutationProtocol {
//	var value: Int = 58
//	var name: String = "Name"
//}


//calculateValue(type: SomeClass())
//calculateValue(type: SomeStruct())

// Protocol is a data type (!!!)
// Can be used for struct, classes, enums

// Protocol inheritance
// ...

protocol CalcutationProtocol {
	var value: Int { get }
}

protocol NewProtocol {
	func printValue()
	func doSomething()
}

extension NewProtocol {
	func doSomething() {
		//...
	}
}

// Functions also
// Default impl

extension CalcutationProtocol {
	var value: Int {
		10
	}
}

class SomeClass2: CalcutationProtocol {
	var address: String = ""
}

// Mutating

protocol SetPropertyProtocol {
		mutating func setProperty(_ value: Int)
}

class ExampleClass : SetPropertyProtocol {
		var property: Int = 0
	
		func setProperty(_ value: Int){
				self.property = value
		}
}

// Allowed only for classes
protocol MyProtocol: AnyObject { }


// Extensions

protocol Example1 {
		var property1: Int { get set }
}

protocol Example2 {
		var property2: Int { get set }
}

protocol SuperProtocol: Example1, Example2 {}

struct StructExample: SuperProtocol {
		var property1: Int = 5
		var property2: Int = 5
}

class ClassExample: SuperProtocol {
		var property1: Int = 5
		var property2: Int = 5
}

var myClass = ClassExample()
var myStruct = StructExample()

extension Example1 {
		func printProperty() {
				print("property1 - \(self.property1)")
		}
}

extension Example2 {
		mutating func setProperty(_ value: Int) {
				self.property2 = value
		}
}

extension SuperProtocol {
		var sumProperty: Int { self.property1 + self.property2 }
}

myClass.printProperty()
myStruct.printProperty()
myClass.sumProperty
