//
//  NetworkManager.swift
//  mobileadmin
//
//  Created by Muhammet Ali Yahyaoğlu on 21.12.2023.
//
import Alamofire
import SwiftUI

class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func post<T: Decodable>(baseURL: HandleBaseURL.BaseUrl,
                            path: String,
                            model: T.Type,
                            queryParameters: [String: Any]? = nil,
                            data: [String: Any]? = nil,
                            completion: @escaping (Result<T, Error>) -> Void) {
        let baseUrlString = HandleBaseURL.handleBaseUrl(baseURL)
        let headers: HTTPHeaders = []
        AF.request(baseUrlString + path,
                   method: .post,
                   parameters: data,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                   
                    print("Response Value: \(value)")
                    completion(.success(value))
                    
                case .failure(let error):
                    print("Response Error: \(error)")
                    completion(.failure(error))
                }
            }
        
    }
    
    func get<T: Decodable>(baseURL: HandleBaseURL.BaseUrl,
                           path: String,
                           model: T.Type,
                           queryParameters: [String: Any]? = nil,
                           completion: @escaping (Result<T, Error>) -> Void) {

        let baseUrlString = HandleBaseURL.handleBaseUrl(baseURL)

      
            let headers: HTTPHeaders = []

            AF.request(baseUrlString + path,
                       method: .get,
                       parameters: queryParameters,
                       encoding: URLEncoding.default,
                       headers: headers)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        print(error)
                        completion(.failure(error))
                    
            }
        }
    }

}














