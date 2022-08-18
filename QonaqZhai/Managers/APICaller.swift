//
//  APICaller.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 17.08.2022.
//

import Foundation

enum APIError: Error {
    case NetworkError
}

final class APICaller {
    static let shared = APICaller()
    
    private enum Constants: String {
        case APIKey = "7da2270e0cmshc887a4e83a72413p18d32ejsnb615cba0bfcd"
        case APIHost = "booking-com.p.rapidapi.com"
    }
    
    private let headers = [
        "X-RapidAPI-Key": Constants.APIKey.rawValue,
        "X-RapidAPI-Host": Constants.APIHost.rawValue
    ]
    
    func searchLocation(query: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        
        guard let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: "https://booking-com.p.rapidapi.com/v1/hotels/locations?locale=en-gb&name=\(formattedQuery)") else {
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, _, error)  in
            guard let data = data, error == nil else {
                completion(.failure(APIError.NetworkError))
                return
            }
            
            do {
                let data = try JSONDecoder().decode([Location].self, from: data)
                completion(.success(data.filter { $0.destType == "city" }))
            } catch {
                completion(.failure(error))
            }
            
        }

        dataTask.resume()
    }
}
