//
//  RequestSession.swift
//  ViperApp
//
//  Created by Jesus Loaiza Herrera on 28/09/23.
//

import Foundation

class RequestSession {
    
  // Aqui pasarle todos los paraemtros
    func sendRequest<T>(
        url: URL,
        httpMethod: String,
        headers: [String: String]?,
        parameters: T?,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) where T: Encodable {
        do {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            
          // headers
            if let headers = headers {
                for (key, value) in headers {
                    request.addValue(value, forHTTPHeaderField: key)
                }
            }
            
            // params
            if let parameters = parameters {
                let postData = try JSONEncoder().encode(parameters)
                request.httpBody = postData
            }
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                completionHandler(data, response, error)
            }
            
            dataTask.resume()
        } catch {
            completionHandler(nil, nil, error)
        }
    }
}
