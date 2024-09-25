//: [Previous](@previous)
/*:
 ***
 **Liskov Substitution Principle (LSP)**: Subtypes should be substitutable for their base types without altering the correctness of the program.
 ***
 */
import Foundation
// Violation of LSP
class Bird {
    func fly() {
        print("Flying in the sky.")
    }
}

class Penguin: Bird {
    override func fly() {
        // Penguins can't fly
        print("I can't fly!")
    }
}

// Usage
let birds: [Bird] = [Bird(), Penguin()]
birds.forEach { $0.fly() }



/*:
 **Problem**: Suppose we have a base class Bird and a derived class Penguin which violates LSP because it cannot fly. \
 **Solution**: We can split the behavior into separate protocols.
 */

protocol Bird1 {
    func sound() -> String
}

protocol Flyable {
    func fly()
}

class Sparrow: Bird1, Flyable {
    func sound() -> String {
        return "Chirp"
    }
    
    func fly() {
        print("Flying in the sky.")
    }
}

class Penguin1: Bird1 {
    func sound() -> String {
        return "Honk"
    }
}

// Usage
let birds1: [Bird1] = [Sparrow(), Penguin1()]
birds1.forEach { print($0.sound()) }

let flyableBirds: [Flyable] = [Sparrow()]
flyableBirds.forEach { $0.fly() }


//: [Next](@next)
