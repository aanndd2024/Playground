//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

func APIA() async {
    print("Task Async A started")
    try? await Task.sleep(nanoseconds: 1_000_000_000) // Simulate some work with a delay
    print("Task Async A completed")
}

func APIB() async {
    print("Task Async B Started")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("Task Async B Completed")
}

func APIC() async {
    print("Task Async C Started")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("Task Async C Completed")
}

func API_A(completion: @escaping() -> Void) {
    print("Dispatch Group-A called")
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Dispatch Group-A completed")
        completion()
    }
}

func API_B(completion: @escaping() -> Void) {
    print("Dispatch Group-B called")
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Dispatch Group-B Completed")
        completion()
    }
}

func API_C() {
    print("Dispatch Group-C called")
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Dispatch Group-C Completed")
    }
}

//Using DispatchGroup
func executeAllAPIWithDispatchGroup() {
    let group = DispatchGroup()
    group.enter()
    API_A {
        group.leave()
    }

    group.enter()
    API_B {
        group.leave()
    }
    
    group.notify(queue: .main) {
        API_C()
    }
}

func executeAllAPIWithNSOperation() {
    let queue = OperationQueue()
    
    let blockOperationA = BlockOperation {
        print("Operation-A Completed")
    }
    
    let blockOperationB = BlockOperation {
        print("Operation-B Completed")
    }
    
    let blockOperationC = BlockOperation {
        print("Operation-C Completed")
    }
    
    blockOperationC.addDependency(blockOperationA)
    blockOperationC.addDependency(blockOperationB)

    queue.addOperations([blockOperationA, blockOperationB, blockOperationC], waitUntilFinished: false)
}

func executeAllAPIWithAsyncAwait() async {
    async let resultA = APIA()
    async let resultB = APIB()
    await (resultA, resultB)
    
    await APIC()
}
executeAllAPIWithDispatchGroup()
executeAllAPIWithNSOperation()
Task {
    await executeAllAPIWithAsyncAwait()
}

//: [Next](@next)
