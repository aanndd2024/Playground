//: [Previous](@previous)
/*:
 ***
 **Open/Closed Principle (OCP)**: Software entities should be open for extension but closed for modification. This means that the behavior of a class should be extendable without modifying its source code.A class should have only one reason to change.\ This means that a class should only have one job or responsibility.
 ***
 */
// Violation of OCP
import Foundation
class AreaCalculator {
    func area(of shape: Any) -> Double {
        if let rectangle = shape as? Rectangle {
            return rectangle.width * rectangle.height
        } else if let circle = shape as? Circle {
            return .pi * circle.radius * circle.radius
        }
        return 0
    }
}

class Rectangle {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

class Circle {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
}


/*:
 **Problem**: Imagine a class that calculates the area of different shapes. Whenever any new shape added, need to change AreaCalculator class. \
 **Solution**: We can use a protocol to define a contract for shapes. This way, new shapes can be added without modifying the AreaCalculator.
 */

protocol Shape {
    func area() -> Double
}

class Rectangle1: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
        return width * height
    }
}

class Circle1: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return .pi * radius * radius
    }
}

class AreaCalculator1 {
    func area(of shape: Shape) -> Double {
        return shape.area()
    }
}

// Usage
let shapes: [Shape] = [Rectangle1(width: 10, height: 20), Circle1(radius: 5)]
let calculator = AreaCalculator1()
for shape in shapes {
    print("Area: \(calculator.area(of: shape))")
}


//: [Next](@next)
