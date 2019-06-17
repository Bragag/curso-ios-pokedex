import Foundation

enum RequestMakerError: Error {
    case malformedURL
    case requestFailed
    case invalidData
    case decodingFailed
}

//completion(.failure(.malformedUrl))

class RequestMaker {
    static let decoder = JSONDecoder()
    
    enum Endpoint {
        
        case list
        case details(query: Int)
        case moves
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            case .moves:
                return "moves"
            }
        }
        
    }
    
    let baseUrl = "http://localhost:3000/"
    let session  = URLSession.shared
    
    typealias RequestResult<T> = Result <T, RequestMakerError>
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
    typealias SuccessCallback<T: Decodable> = (T) -> Void
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping SuccessCallback<T>) {
        makeCompletion(withEndpoint: endpoint) {
            (result: RequestResult<T>) in
                switch result {
                case .success(let object):
                    completion(object)
                case .failure:
                    break
            }
        }
    }
            
    func makeCompletion<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpoint.url)") else {
            completion(.failure(.malformedURL))
            return
        }
        
        let dataTask = session.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                
                let decodedObject = try RequestMaker.decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
                
            } catch {
                completion(.failure(.decodingFailed))
                return
            }
            
        }
        
        dataTask.resume()
        
    }
}


