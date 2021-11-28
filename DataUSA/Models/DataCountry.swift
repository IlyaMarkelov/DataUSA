//
//  DataUSA.swift
//  DataUSA
//
//  Created by Илья Маркелов on 26.11.2021.
//


struct DataState: Decodable {
    let State: String?
    let Year: String?
    let Population: Int?
}

struct DataUSA: Decodable {
    var data: [DataState]?
}
