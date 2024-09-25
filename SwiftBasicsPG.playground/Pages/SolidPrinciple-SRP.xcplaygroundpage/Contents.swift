//: [Previous](@previous)

import Foundation


/*:
 ***
 **Open Close Principle** - Should be open for extension but closed for modification\
 Allowing new features to be added without altering existing code, thus reducing the risk of bugs.
 ***
 */


/*:
 ***
 **Interface Segregation Principle (ISP)**\
 Principle: Clients should not be forced to depend on interfaces they do not use. Instead of having one large interface, many smaller, more specific interfaces are preferred.\
 By creating separate Workable and Eatable protocols, Robot is not forced to implement methods it does not need, and Human implements only what it needs.
 ***
 */
// A protocol that violates ISP
protocol Worker {
    func work()
    func eat()
}

// This class violates ISP since a robot does not need to eat
class Robot: Worker {
    func work() {
        print("Robot working")
    }

    func eat() {
        // Robots don't eat, but forced to implement
    }
}

// Refactored to follow ISP
protocol Workable {
    func work()
}

protocol Eatable {
    func eat()
}

class Human: Workable, Eatable {
    func work() {
        print("Human working")
    }

    func eat() {
        print("Human eating")
    }
}

class Robot1: Workable {
    func work() {
        print("Robot working")
    }
}

//: [Next](@next)
