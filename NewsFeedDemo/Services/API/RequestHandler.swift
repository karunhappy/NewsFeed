//
//  RequestHandler.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation

class RequestHandler {
    static let shared = RequestHandler()

    func connectToServer(urlString: String, httpMethod: HTTPMethod, completion: @escaping ((Data?) -> ())) {
        let session = URLSession.init(configuration: .default)
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue

        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
