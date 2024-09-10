//: [Previous](@previous)
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import Foundation

// Define a function that performs a network request
func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        if let data = data {
            completion(.success(data))
        }
    }
    task.resume()
}

// Usage of the function
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!

fetchData(from: url) { result in
    switch result {
    case .success(let data):
        print("Data received: \(data)")
    case .failure(let error):
        print("Error occurred: \(error)")
    }
}

//: [Next](@next)
