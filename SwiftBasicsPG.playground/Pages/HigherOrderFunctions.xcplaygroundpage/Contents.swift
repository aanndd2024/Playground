//: [Previous](@previous)
/*:
 ***
 **Map()**: The map function is like applying the same rule to every item on a list.
 ***
 */
import Foundation
let prices = [100, 200, 300]
let discountedPrices = prices.map { $0 * 10 }
print("Map result:",discountedPrices) // [90.0, 180.0, 270.0]

/*:
 ***
 **Filter()**: The filter function helps you pick out items from a list that meet certain criteria.
 ***
 */
let dishes = ["Chicken", "Salad", "Egg", "Vegetable Soup"]
let vegetarianDishes = dishes.filter { $0.contains("Vegetable") || $0 == "Salad" }
print("Filter result:", vegetarianDishes) // ["Salad", "Vegetable Soup"]

let filterArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filterResult = filterArr.filter{ $0 % 2 == 0}
print("Filter result:", filterResult)
/*:
 ***
 **Reduce()**: The reduce function is like summing up your bill at the end of a meal. You start with an initial value (like $0) and then combine all items in a list to get a final result.
 ***
 */
let bill = prices.reduce(0) { $0 + $1 }
print("Reduce Result: ",bill) // 600.0

var sum = 0
let reduceArr = [1, 2, 3, 4, 5]
let resultArr = reduceArr.reduce(sum, { $0 + $1 })
print(resultArr)

/*:
 ***
 **Sorted()**:
 ***
 */
let arr = [1, 2, 3, 4, 5]
let sortedArr = arr.sorted{ $0 < $1 }
print("Sorted Arr: ", sortedArr)
/*:
 ***
 ForEach(): The forEach function in Swift takes a closure as its argument. This closure is applied to each element in the collection.
***
 */
let numbers = [1, 2, 3, 4, 5]
numbers.forEach { number in
    print(number)
}
//: [Next](@next)
