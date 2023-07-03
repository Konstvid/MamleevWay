//
//  NetworkServiceProtocol .swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getImages(page: Int, completion: @escaping ImageCompletion)
}

class NetworkService: NetworkServiceProtocol  {
    
    func getImages(page: Int, completion: @escaping ImageCompletion) {
        let baseURL = "https://api.unsplash.com/photos/?page=\(page)&query=office&client_id="
        getRequest(URLString: baseURL + accessKey) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Image].self, from: data)
                    completion(.success(jsonData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

extension NetworkService {
    
    private func getRequest(URLString: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: URLString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
