//
//  NetworkManager.swift
//  Stocks
//
//  Created by sidkotha on 06/05/23.
//

import Foundation

class NetworkManager {
    
    func startLoad(completionHandler: @escaping (Result<Stocks, Error>) -> Void) {
        let urlString = "https://run.mocky.io/v3/6d0ad460-f600-47a7-b973-4a779ebbaeaf"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Stocks.self, from: data)
                    completionHandler(.success(decodedData))
                    return
                    
                } catch let error {
                    completionHandler(.failure(error))
                    return
                }
            }
        }
        task.resume()
    }
}
