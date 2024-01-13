//
//  LocationPageViewViewModel.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation


class LocationPageViewViewModel:ObservableObject{
    var locationID:String=""
    @Published var locations: [SingleLocationModel] = []

    
    func fetchSingleLocation(){
        Services().getSingleLocation(locationID: locationID) { result in
            switch result {
            case .success(let singleLocationModel):
                self.locations=[singleLocationModel]
                print(self.locations)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
