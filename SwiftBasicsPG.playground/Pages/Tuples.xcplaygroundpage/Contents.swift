//: [Previous](@previous)
/*:
 ***
 A tuple is a group of different values. And, each value inside a tuple can be of different data types.
 ***
 */
import Foundation
var product = ("MacBook", 1099.99)
print(product.0)
print(product.1)

//Tuple with name
var company = (product: "Programiz App", version: 2.1)
print(company.product)
print(company.version)

var alphabets = ("A", "B", "C", ("a", "b", "c"))
print(alphabets.0)
print(alphabets.3.0)

var laptopLaunch = ("MacBook", 1299, ["Nepal": "10 PM", "England": "10 AM"])
print(laptopLaunch.2)
laptopLaunch.2["USA"] = "11 AM"
print(laptopLaunch.2)

//Tuples with multiple values type like Array , Dictionary , String , Int , Bool
let dataProvider = (dic: ["name": "Joy"], array : ["John", "Kelly"], name: "Joy", number: 1000, status: false)
//Output
dataProvider.dic    // ["name": "Joy"]
dataProvider.array  // ["John", "Kelly"]
dataProvider.name   // "Joy"
dataProvider.number // 1000
dataProvider.status // false

//Tuple as a return type
func getPhoneInfo() -> (name: String, price: Float){
     return (name: "iPhone X", price: 1000)
}
//Output
getPhoneInfo().name // "iPhone X"

//: [Next](@next)
