//: [Previous](@previous)
/*:
 ***
 **Interface Segregation Principle (ISP)**: Clients should not be forced to depend on interfaces they do not use. This principle encourages creating smaller, more specific interfaces.
 ***
 */
import Foundation
// Violation of ISP
protocol Bird {
    func fly()
    func swim()
    func mimic()
}

final class Duck: Bird {
    /// ❌ Breaks ISP since duck can fly and swim but cannot mimic
    func fly() { print("Duck can fly") }
    func swim() { print("Duck can swim") }
    func mimic() { print("Duck can mimic") }
}

final class Parrot: Bird {
    /// ❌ Breaks ISP since parrot can fly and mimic but cannot swim
    func fly() { print("Parrot can fly") }
    func swim() { print("Parrot can swim") }
    func mimic() { print("Parrot can mimic") }
}

final class Penguin: Bird {
    /// ❌ Breaks ISP since penguin can swim but not fly or mimic
    func fly() { print("Penguin can fly") }
    func swim() { print("Penguin can swim") }
    func mimic() { print("Penguin can mimic") }
}

/*:
 **Problem**: Suppose we have a Worker protocol with many methods that a Robot doesn't need to implement. \
 **Solution**: We can split the protocol into smaller ones.
 */

protocol FlyingBird {
    func fly()
}

protocol SwimmingBird {
    func swim()
}

protocol MimickingBird {
    func mimic()
}

final class Duck1: FlyingBird, SwimmingBird {
    /// ✅ Follows ISP since duck and fly and swim and need not mimic
    func fly() { print("Duck can fly") }
    func swim() { print("Duck can swim") }
}

final class Parrot1: FlyingBird, MimickingBird {
    /// ✅ Follows ISP since parrot can fly and mimic and need not swim
    func fly() { print("Parrot can fly") }
    func mimic() { print("Parrot can mimic") }
}

final class Penguin1: SwimmingBird {
    /// ✅ Follows ISP since penguin can swim and need not fly or mimic
    func swim() { print("Penguin can swim") }
}

// Usage
let duck: Duck1 = Duck1()
duck.fly()
duck.swim()

let parrot: Parrot1 = Parrot1()
parrot.fly()
parrot.mimic()

let penguin: Penguin1 = Penguin1()
penguin.swim()


//: [Next](@next)
