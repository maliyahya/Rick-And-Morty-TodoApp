//
//  Services.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation

class Services{
    func findCharacter(no: String, completion: @escaping (Result<SingleCharacterModel, Error>) -> Void) {
        NetworkManager.shared.get(baseURL: HandleBaseURL.BaseUrl.main, path: "character/\(no)", model: SingleCharacterModel.self) { result in
            switch result {
            case .success(let characterModel):
                completion(.success(characterModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    func getAllCharacter(completion: @escaping (Result<AllCharacterModel, Error>) -> Void){
        NetworkManager.shared.get(baseURL: HandleBaseURL.BaseUrl.main, path: "character", model:AllCharacterModel.self){
            result in
            switch result{
            case .success(let allCharacterModel):
            completion(.success(allCharacterModel))
            case .failure(let error):
                completion(.failure(error))

            }
        }
    }
    
    func getSingleLocation(locationID:String,completion: @escaping(Result<SingleLocationModel, Error>) -> Void){
        NetworkManager.shared.get(baseURL: HandleBaseURL.BaseUrl.main, path: "location/\(locationID)", model: SingleLocationModel.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))

            }
        }
    }
    func getCharactersEpisodes(episode:[String],completion: @escaping(Result<EpisodeModel, Error>) -> Void){
        for i in 0..<episode.count {
            NetworkManager.shared.get(baseURL: HandleBaseURL.BaseUrl.other, path: episode[i], model: EpisodeModel.self) { result in
                switch result {
                case .success(let success):
                    completion(.success(success))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    func getEpisodeDetails(episodeURL:String,completion:@escaping(Result<EpisodeModel,Error>)->Void){
        NetworkManager.shared.get(baseURL: HandleBaseURL.BaseUrl.other, path: episodeURL, model: EpisodeModel.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
}

