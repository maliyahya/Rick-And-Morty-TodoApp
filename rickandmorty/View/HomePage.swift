//
//  HomePage.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView {
            CharacterPage()
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Characters")
                }
            EpisodePage()
                .tabItem {
                    Image(systemName: "book.pages.fill")
                    Text("Episodes")
                }
            LocationPage()
                .tabItem {
                    Image(systemName: "location.square.fill")
                    Text("Location")
                }
            
     
            
        }
    }
}

