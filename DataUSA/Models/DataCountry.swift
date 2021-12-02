//
//  DataUSA.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//


struct DataState: Decodable {
    let state: String?
    let year: String?
    let population: Int?
    
    enum CodingKeys: String, CodingKey {
        case state = "State"
        case year = "Year"
        case population = "Population"
    }
    
//    init(state: String, year: String, population: Int) {
//        self.state = state
//        self.year = year
//        self.population = population
//    }
//    
//    init(dataState: [String: Any]) {
//        state = dataState["State"] as? String
//        year = dataState["Year"] as? String
//        population = dataState["Population"] as? Int
//    }
}

struct DataUSA: Decodable {
    var data: [DataState]?
}

enum Link: String {
    case dataUSAApi = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"
}
