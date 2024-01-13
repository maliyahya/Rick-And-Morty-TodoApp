//
//  LocationPage.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import SwiftUI
import Foundation

struct LocationPage: View {
    
    @StateObject var locationVC=LocationPageViewViewModel()
    var body: some View {
        ScrollView {
            VStack {
                
                Text("Rick And Morty Location")
                    .fontWeight(.bold)
                    .font(.title)
                Text("Aramak istediğiniz binanın numarasını giriniz")
                    .font(.subheadline)
                TextField("", text: $locationVC.locationID)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
                HStack {
                    Button(action: {
                        locationVC.fetchSingleLocation()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 160, height: 50)
                                .cornerRadius(15)
                            Text("ID'ye Göre Ara")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                        }
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 160, height: 50)
                                .cornerRadius(15)
                            Text("Hepsini Getir")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    })
                   
                }
                if(locationVC.locations != []){
                        LazyVGrid(columns: [
                            GridItem(.fixed(200)),
                            GridItem(.fixed(200))
                        ], content: {
                            ForEach(locationVC.locations , id: \.id) { locations in
                                PreviewLocationBox(name: "Selam")
                            }
                        })
                    
                    
                    
                }
              
            }
        }
        .padding()
    }
}
