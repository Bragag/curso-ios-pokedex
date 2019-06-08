import Foundation

class RequestMaker {
    
    enum Endpoint {
        
        case list
        case details(query: String)
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            }
        }
        
    }
    
    let baseUrl = "http://localhost:3000/"
    let session  = URLSession.shared
    typealias CompletionCallback<T: Decodable> = (T) -> Void
    
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpoint.url)") else {
            return
        }
        
        let dataTask = session.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print("Error")
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                
                completion(decodedObject)
            } catch let error {
                print("error: ", error)
            }
            
            //                print(String(data: data, encoding: .utf8)!)
        }
        
        dataTask.resume()

    }
}

