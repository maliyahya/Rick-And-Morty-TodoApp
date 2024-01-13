//
//  AllLocationModel.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation

struct AllLocationModel:Codable{
    var info: info?
    var results: [SingleLocationModel]?
}

struct info:Codable{
    var count, pages: Int?
    var next: String?
}

