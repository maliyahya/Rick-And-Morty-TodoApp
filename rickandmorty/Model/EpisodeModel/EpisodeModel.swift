//
//  EpisodeModel.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 25.12.2023.
//

import Foundation

struct EpisodeModel:Codable {
    var id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
