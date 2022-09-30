import UIKit
// SOLID

// Single Responsibility: A class should have one, and only one, reason to change.

// connect, download, parse, save
class FileHandler {
	
//	let connectionManager: ConnectionManager
//	let storageManager: StorageManager
//
//	init() {}
//	func downloadFile(_ from: URL) {
//
//	}
}

// Singletone
//let sharedNetworkManager = NetworkManager(baseURL: API.baseURL)


//class NetworkManager {
//
//		static let shared = NetworkManager()
//
//		// MARK: - Properties
//
//		let baseURL: URL
//
//		// Initialization
//
//		init() {
//				self.baseURL = baseURL
//		}
//
//	  func connect() {}
//}
//
// AppDelegate
// UserDefaults.standard

class ConnectionManager {
	func connectToServer() {}
}

class StorageManager {
	func saveFile() {}
	func fetchFile() {}
}

// Open-Closed: Software entities, including classes, modules and functions, should be open for extension but closed for modification.

protocol DataPrintable {
	func printData()
}

class Person: DataPrintable {
	let name: String
	let age: Int
	
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
	
	func printData() {
		print("\(name) age \(age)")
	}
}

class Dogs: DataPrintable {
	let name: String
	let breed: String
	
	init(name: String, breed: String) {
		self.name = name
		self.breed = breed
	}
	
	func printData() {
		print("\(name) breed \(breed)")
	}
}


class Logger {
	let objects: [DataPrintable] = [Dogs(name: "", breed: ""), Person(name: "Olga", age: 54), Person(name: "Masha", age: 5), Person(name: "Petya", age: 54)]
	
	func printData() {
		objects.map {
			$0.printData()
		}
	}
}

// Liskov Substitution: Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.

class FileStorage {
	func saveFile() {}
}

class ImageStorage: FileStorage {
	func saveImage() {}
}

let storage = ImageStorage()
storage.saveFile()



//  Interface Segregation: Clients should not be forced to depend upon interfaces they do not use.
//  Instead of one fat interface, many small interfaces are preferred based on groups of methods

protocol GestureProtocol {
		func didDoubleTap()
		func didLongPress()
}

protocol SimpleGestureProtocol {
	func didTap()
}

class SuperButton: GestureProtocol, SimpleGestureProtocol {
		func didTap() {
				// Single tap operation
		}
		func didDoubleTap() {
				// double tap operation
		}
		func didLongPress() {
				// long press operation
		}
}

class SimpleTapButton: SimpleGestureProtocol {
		func didTap() {
				// Single tap operation
		}
}

// Dependency Inversion: Depend upon abstractions, not concretions.
// High-level modules should not depend on low-level modules both should depend on Abstractions. (Abstractions should not depend upon details. Details should depend upon abstractions)

protocol Storage {
		func save(string: String)
}

class FileSystemManager: Storage { // <<<< low-level module, easy to reuse
		func save(string: String) {
				// Open a file
				// Save the string in this file
				// Close the file
	 }
}

class DatabaseManager: Storage {
		func save(string: String) {
			// save to core data
	 }
}


class Handler { // <<<< high-level, not reusable, depends on file manager
		let manager: Storage
		var dependency: String = ""
	
		init(_ manager: Storage) {
			self.manager = manager
		}
		
		func handle(string: String) {
				manager.save(string: string)
		}
}

let coreDataManager = DatabaseManager()
let handler = Handler(coreDataManager)


let fileManager = FileSystemManager()
let fileHandler = Handler(fileManager)
fileHandler.dependency = "123"
