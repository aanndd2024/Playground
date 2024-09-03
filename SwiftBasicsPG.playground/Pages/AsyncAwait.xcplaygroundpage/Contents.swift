//: [Previous](@previous)
/*:
1. Concurrent Execution
* async indicate that a function returns its result asynchronously
- await waits for all tasks to complete.

 __Concurrent Execution__\
 async let allows you to start multiple asynchronous tasks concurrently and await their results later.\
 async let post1 = fetchPost(id: ids[0])\
 async let post2 = fetchPost(id: ids[1])\
 async let post3 = fetchPost(id: ids[2])\
 Await all results concurrently\
 let posts = try await [post1, post2, post3]\
 
 __Sequential Execution__\
 let post1 = try await fetchPost(id: ids[0])\
 let post2 = try await fetchPost(id: ids[1])\
 let post3 = try await fetchPost(id: ids[2])\
 return [post1, post2, post3]\
 Here each post is fetched one after the other, This can result in slower overall execution time compared to the concurrent example using async let.

 */


import Foundation

struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}

enum FetchError: Error {
    case invalidURL
    case decodingFailed
    case unknown(Error)
}

func fetchPost(id: Int) async -> Result<Post, FetchError> {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") else {
        return .failure(.invalidURL)
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let post = try JSONDecoder().decode(Post.self, from: data)
        return .success(post)
    } catch let decodingError as DecodingError {
        return .failure(.decodingFailed)
    } catch {
        return .failure(.unknown(error))
    }
}

//Parallel Asynchronous Operations
func fetchMultiplePostsInParallel(ids: [Int]) async -> [Post] {
    var posts: [Post] = []
    
    // Start fetching all posts concurrently
    async let post1 = fetchPost(id: ids[0])
    async let post2 = fetchPost(id: ids[1])
    async let post3 = fetchPost(id: ids[2])
    async let post4 = fetchPost(id: ids[3])
    async let post5 = fetchPost(id: ids[4])
    async let post6 = fetchPost(id: ids[5])
    
    // Wait for all operations to complete and unwrap the results
    let results = await [post1, post2, post3, post4, post5, post6]
    
    // Process the results
    for result in results {
        switch result {
        case .success(let post):
            posts.append(post)
            print(post.id)
        case .failure(let error):
            print("Failed to fetch post: \(error)")
        }
    }
    return posts
}

Task {
    let ids = [1, 2, 3, 4, 5, 6]
    let posts = await fetchMultiplePostsInParallel(ids: ids)
    //print("Fetched posts: \(posts)")
}

//Fetching posts one after the other
func fetchPostsSequentially(ids: [Int]) async -> [Post] {
    var posts: [Post] = []
    
    for id in ids {
        let result = await fetchPost(id: id)
        switch result {
        case .success(let post):
            posts.append(post) // Append the post to the array
            print(post.id)
        case .failure(let error):
            print("Failed to fetch post with id \(id): \(error)")
            // Handle the error or continue with the next post
        }
    }
    return posts
}

// Usage
Task {
    let ids = [1, 2, 3]
    let posts = await fetchPostsSequentially(ids: ids)
    print("Fetched posts: \(posts)")
}


//: [Next](@next)
