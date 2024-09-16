//: [Previous](@previous)

import Foundation

let operationQueue = OperationQueue()

let takeOrder = BlockOperation {
    print("Taking order from customer 1")
}

let makeCoffee = BlockOperation {
    print("Making coffee for customer 2")
}

let cleanTable = BlockOperation {
    print("Cleaning table for customer 3")
}

operationQueue.addOperation(takeOrder)
operationQueue.addOperation(makeCoffee)
operationQueue.addOperation(cleanTable)
//: [Next](@next)
