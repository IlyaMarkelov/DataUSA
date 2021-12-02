//
//  NetworkManager.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

//let url = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"

class NetworkManager {
    
//    var dataUSA: DataUSA?
    
    static let shared = NetworkManager()
    
    private init() {}
    
//    func fetchDataUSA(from url: String?, completion: @escaping (Result<DataUSA, NetworkError>) -> Void) {
//        guard let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                let dataUSA = try JSONDecoder().decode(DataUSA.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(dataUSA))
//                }
//            } catch  {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
    
    func fetchDataUSAWithAlamofire(from url: String, completion: @escaping (Result<DataUSA, NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataUSAResponse in
                switch dataUSAResponse.result {
                case .success(_):
                    let dataUSA = DataUSA()
                    completion(.success(dataUSA))
                case .failure(_):
                    completion(.failure(.decodingError))
                }
            }
    }
    
}

