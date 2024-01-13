//
//  AllCharacterModel.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation

struct AllCharacterModel:Codable{
    let info: Info?
    let results: [SingleCharacterModel]?
}

struct Info:Codable {
    let count, pages: Int?
    let next: String?
}
