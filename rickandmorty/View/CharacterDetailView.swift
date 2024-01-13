//
//  DetailView.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation
import SwiftUI
struct CharacterDetailView:View{
    
    var body:some View{
        let character = CacheManager.shared.getCharacter()
        let episodes = character?.episode
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: character?.image ?? "")) { phase in
                    switch phase {
                    case .empty:
                        Text("Yükleniyor...")
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Text("Resim yüklenemedi")
                    @unknown default:
                        Text("Bilinmeyen durum")}
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                HStack(spacing:15){
                    InfoCard(title: "Status", result: character?.status ?? "No Status")
                    InfoCard(title: "Gender", result: character?.gender ?? "No Gender")
                }
                HStack(spacing:15){
                    InfoCard(title: "Types", result: character?.type ?? "No Type")
                    InfoCard(title: "Species", result: character?.species ?? "No Species")
                }
                HStack(spacing:15){
                    InfoCard(title: "Origin", result: character?.origin?.name  ?? "No origin")
                    InfoCard(title: "Location", result: character?.location?.name ?? "No Location")
                }
                HStack(spacing:15){
                    InfoCard(title: "Created", result: String(character?.created?.prefix(10) ?? "No Created"))
                    InfoCard(title: "Episode", result: "\(String(describing: character?.episode?.count))" )
                }
                ScrollView(.horizontal){
                    HStack(spacing:10){
                        ForEach(0..<min(character?.episode?.count ?? 0, 10)) { index in
                            EpisodeCard(url: character?.episode?[index] ?? "")
                        }
                    }
                }
            }
            .navigationBarTitle(character?.name ?? "Unknown Character", displayMode: .automatic)
        }
    }
}
struct EpisodeCard: View {
    var url: String
    @State private var isLoading: Bool = true
    @State private var episodeModel: EpisodeModel?
    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.mint)
                .frame(width: 300, height: 100)
                .cornerRadius(50)
            VStack() {
                if isLoading {
                    ProgressView("Loading...")
                } else {
                    VStack() {
                        Text("Episode " + (episodeModel?.episode ?? ""))
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Text(episodeModel?.name ?? "")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Text("Aired on " + (episodeModel?.air_date ?? "00.00.00"))
                    }
                }
            }
        }.onAppear {
            Services().getEpisodeDetails(episodeURL: url ) { result in
                switch result {
                case .success(let success):
                    episodeModel = success
                    isLoading=false
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
struct InfoCard:View{
    @State var title:String
    var result:String
    var body:some View{
        ZStack{
            Rectangle()
                .foregroundColor(.indigo)
                .frame(width:180,height: 100)
                .cornerRadius(15)
            HStack{
                Image(systemName: "bell")
                    .foregroundColor(.red)
                    .padding(.leading,15)
                
                Text(result)
                    .font(.subheadline)
                
            }
            .padding(.trailing,15)
            
            Text("               "+title+"                   ")
                .fontWeight(.bold)
                .background(Color.mint)
                .frame(width: 180)
                .padding(.top, 77)
                .cornerRadius(15)
        }
        
    }
}


#Preview{
    CharacterDetailView()
}
