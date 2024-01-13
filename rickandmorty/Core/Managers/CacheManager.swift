//
//  CacheManager.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()

    private init() {}

    private let tokenKey = "accessToken"
    private let characterKey = "cachedCharacter"


    func saveAccessToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }

    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }

    func clearAccessToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    
    func saveCharacter(_ character: SingleCharacterModel) {
           do {
               let encoder = JSONEncoder()
               let data = try encoder.encode(character)
               UserDefaults.standard.set(data, forKey: characterKey)
           } catch {
               print("Error encoding character: \(error.localizedDescription)")
           }
       }
    
    func getCharacter() -> SingleCharacterModel? {
           if let data = UserDefaults.standard.data(forKey: characterKey) {
               do {
                   let decoder = JSONDecoder()
                   let character = try decoder.decode(SingleCharacterModel.self, from: data)
                   return character
               } catch {
                   print("Error decoding character: \(error.localizedDescription)")
               }
           }
           return nil
       }
    
    
}

