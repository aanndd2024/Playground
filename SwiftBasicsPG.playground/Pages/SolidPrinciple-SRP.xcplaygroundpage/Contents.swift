//: [Previous](@previous)
/*:
 ***
 **Single Responsibility Principle (SRP)** - A class should have only one reason to change. This means that a class should only have one job or responsibility.
 ***
 */
// Violation of SRP
import Foundation
class User {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    // Responsibility: Storing user data
    func saveToDatabase() {
        print("Saving \(name) to database.")
    }
}

// Usage
let user = User(name: "John Doe", email: "john@example.com")
user.saveToDatabase()


/*:
 **Problem**: We have a User class that handles both user data and saving the user to a database. This violates SRP.\
 **Solution**: We can split the responsibilities into two separate classes: one for the user data and another for handling database operations.
 */

class User1 {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

class UserRepository {
    func save(user: User1) {
        print("Saving \(user.name) to database.")
    }
}

// Usage
let user1 = User1(name: "John Doe", email: "john@example.com")
let userRepository = UserRepository()
userRepository.save(user: user1)

//: [Next](@next)
