//
//  NetworkManager.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//

import Foundation

class NetworkManager {
    
    var dataUSA: DataUSA?
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataUSA(completed: @escaping () -> ()) {
        guard let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.dataUSA = try JSONDecoder().decode(DataUSA.self, from: data)
                completed()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

