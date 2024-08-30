//: [Previous](@previous)
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct Users: Codable {
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
}

// MARK: - Address
struct Address: Codable {
    var street, suite, city, zipcode: String?
    var geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    var lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    var name, catchPhrase, bs: String?
}

enum UserError: Error {
    case NoDataAvailable
    case InvalidData
    case InvalidURL
}

import Foundation

struct Networking {
    static let shared = Networking()
    let url = "https://jsonplaceholder.typicode.com/users"
    
    func fetchUsers(completion: @escaping(Result<[Users], UserError>) -> Void) {
        guard let userUrl = URL(string: url) else {
            completion(.failure(.InvalidURL))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: userUrl) {data, response, error in
            guard let userData = data else {
                completion(.failure(.NoDataAvailable))
                return
            }
            do {
                let user = try JSONDecoder().decode([Users].self, from: userData)
                completion(.success(user))
            }
            catch {
                completion(.failure(.InvalidData))
            }
        }dataTask.resume()
    }
}

func fetchData() {
    Networking.shared.fetchUsers { result, error in
        switch result {
        case .failure(let error):
            print(error)
        case .success(let users):
            print(users)
        }
    }
}

fetchData()
//: [Next](@next)
