//: [Previous](@previous)

import Foundation

//let queue = DispatchQueue(label: "com.cafe.orderQueue")
//
//queue.async {
//    print("Taking order from customer 1")
//}
//
//queue.async {
//    print("Making coffee for customer 2")
//}
//
//queue.async {
//    print("Cleaning table for customer 3")
//}

DispatchQueue.global().async {
    print("Taking order from customer 1")
}

DispatchQueue.global().async {
    print("Making coffee for customer 2")
}

DispatchQueue.global().async {
    print("Cleaning table for customer 3")
}
//: [Next](@next)




