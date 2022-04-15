//
//  DataUSA.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//

struct DataUSA: Decodable {
    var data: [DataState]?
}

struct DataState: Decodable {
    let state: String?
    let year: String?
    let population: Int?
    
    enum CodingKeys: String, CodingKey {
        case state = "State"
        case year = "Year"
        case population = "Population"
    }
    
    init(dataState: [String: Any]) {
        state = dataState["State"] as? String
        year = dataState["Year"] as? String
        population = dataState["Population"] as? Int
    }
    
    static func getDataUSA(from date: Any) -> [DataState]{
        guard let dataUSA = date as? [String: Any] else {return []}
        guard let dataUSAArray = dataUSA["data"] as? [Any] else {return []}
        guard let dataStateArray = dataUSAArray as? [[String: Any]] else {return []}
        return dataStateArray.compactMap { DataState(dataState: $0)}
    }
}

enum Link: String {
    case dataUSAApi = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"
}
