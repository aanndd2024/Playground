//: [Previous](@previous)
/*:
 ***
 A closure is a self-contained block of functionality that can be passed around and used in your code. Closures can capture and store references to any constants and variables from the context in which they are defined.
 
 Syntax of Closures
 The basic syntax of a closure is as follows:
 { (parameters) -> return type in
     statements
 }
 ***
 */
import Foundation

let greetClosure = { (name: String) -> String in
    return "Hello, \(name)!"
}

let greeting = greetClosure("John")
print(greeting)  // Output: Hello, John!

//: [Next](@next)
