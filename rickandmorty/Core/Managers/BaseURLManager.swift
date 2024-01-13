//
//  BaseURLManager.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation

class HandleBaseURL{
    
    public static func handleBaseUrl(_ baseUrl: BaseUrl) -> String {
        switch baseUrl {
        case .main:
            return "https://rickandmortyapi.com/api/"
        
        case .other:
            return ""
        }
    }
    
    enum BaseUrl {
        case main
        case other
    }
    
}

