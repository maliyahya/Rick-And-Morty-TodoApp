//
//  CharacterViewViewModel.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation


class CharacterViewViewModel:ObservableObject{
    public var no:String=""
    @Published var characters: [SingleCharacterModel] = []
    func fetchSingleCharacter(){
        Services().findCharacter(no: no) { result in
            switch result {
            case .success(let character):
                self.characters = [character]
            case .failure(let error):
                print("Error fetching character: \(error)")
            }
        }
    }
    func fetchAllCharacters(){
        Services().getAllCharacter() { result in
            switch result {
            case .success(let character):
                self.characters=character.results ?? []
                print(character)
            case .failure(let error):
                print("Error fetching character: \(error)")
            }
        }
    }
}
    
    

