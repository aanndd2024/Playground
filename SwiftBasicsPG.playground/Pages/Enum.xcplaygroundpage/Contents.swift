//: [Previous](@previous)
import Foundation
/*:
 ***
 Associated Values\
 Enumerations in Swift can have associated values, which allow you to attach additional information to each case.\
 This is useful when you want to store different types of information for each case.
 ***
 */
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// Usage
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem)-\(manufacturer)-\(product)-\(check)")
case .qrCode(let productCode):
    print("QR Code: \(productCode)")
}

/*:
 ***
 Methods in Enums\
 You can define methods inside an enum to add behavior related to the cases:
 ***
 */
enum TrafficLight {
    case red, yellow, green
    
    func description() -> String {
        switch self {
        case .red:
            return "Stop"
        case .yellow:
            return "Caution"
        case .green:
            return "Go"
        }
    }
}

// Usage
let light = TrafficLight.red
print(light.description()) // Output: Stop

/*:
 ***
 Enum with Associated Values and Methods\
 You can combine associated values and methods to create more complex enums:
 ***
 */
enum Vehicle {
    case car(speed: Int)
    case bicycle(gear: Int)
    case airplane(altitude: Int)
    
    func description() -> String {
        switch self {
        case .car(let speed):
            return "Car traveling at \(speed) km/h"
        case .bicycle(let gear):
            return "Bicycle in gear \(gear)"
        case .airplane(let altitude):
            return "Airplane flying at \(altitude) feet"
        }
    }
}
let myVehicle = Vehicle.car(speed: 120)
print(myVehicle.description()) // Output: Car traveling at 120 km/h

/*:
 ***
 Enum with CaseIterable\
 Swift provides the CaseIterable protocol, which enables you to create an array containing all the cases of an enum.
 ***
 */
enum Beverage: CaseIterable {
    case coffee, tea, juice, water
}

// Usage
let numberOfChoices = Beverage.allCases.count
print("There are \(numberOfChoices) beverages available.") // Output: 4

for beverage in Beverage.allCases {
    print(beverage)
}

/*:
 ***
 Enum with Protocol\
 Enums in Swift can conform to protocols, just like classes and structs.\
 This allows you to define shared behavior across different enum cases.
 ***
 */
protocol Displayable {
    func displayName() -> String
}

protocol Valuable {
    var value: Double { get }
}

enum Currency: String, Displayable, Valuable {
    case usd = "USD"
    case eur = "EUR"
    case jpy = "JPY"
    
    func displayName() -> String {
        switch self {
        case .usd:
            return "US Dollar"
        case .eur:
            return "Euro"
        case .jpy:
            return "Japanese Yen"
        }
    }
    
    var value: Double {
        switch self {
        case .usd:
            return 1.0
        case .eur:
            return 0.85
        case .jpy:
            return 110.0
        }
    }
}

// Usage
let currency = Currency.eur
print(currency.displayName()) // Output: Euro
print(currency.value)          // Output: 0.85
//: [Next](@next)
