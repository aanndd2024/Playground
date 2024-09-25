//: [Previous](@previous)

import Foundation

func sortArray(_ arr: [Int]) -> [Int] {
    return arr.sorted()
}

func testSortArray() {
    let result = sortArray([3, 1, 2])
    assert(result == [1, 2, 3], "Test Failed: Expected [1, 2, 3], but got \(result)")
    print("Test Passed: sortArray([3, 1, 2]) == [1, 2, 3]")
    
    let result2 = sortArray([5, 4, -1, 0])
    assert(result2 == [-1, 0, 4, 5], "Test Failed: Expected [-1, 0, 4, 5], but got \(result2)")
    print("Test Passed: sortArray([5, 4, -1, 0]) == [-1, 0, 4, 5]")
}
testSortArray()
/*: *** */

func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for n in 2..<num {
        if num % n == 0 {
            return false
        }
    }
    return true
}

func testIsPrime() {
    let result = isPrime(5)
    assert(result == true, "Test Failed: Expected true for 5, but got \(result)")
    print("Test Passed: isPrime(5) == true")
    
    let result2 = isPrime(4)
    assert(result2 == false, "Test Failed: Expected false for 4, but got \(result2)")
    print("Test Passed: isPrime(4) == false")
    
    let result3 = isPrime(1)
    assert(result3 == false, "Test Failed: Expected false for 1, but got \(result3)")
    print("Test Passed: isPrime(1) == false")
}
testIsPrime()
/*: *** */

//: [Next](@next)
