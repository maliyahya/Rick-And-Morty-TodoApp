//
//  PreviewBox.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation
import SwiftUI
import Alamofire

struct PreviewCharacterBox: View {
    var model:SingleCharacterModel
    var body: some View {
        NavigationView{
                Button(action: {
                    CacheManager.shared.saveCharacter(model)
                }, label: {
                    VStack {
                                AsyncImage(url: URL(string: model.image ?? "")) { phase in
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
                                        Text("Bilinmeyen durum")
                                    }
                                }
                                .frame(width: 150, height: 150)
                                Text(model.name ?? "")
                                    .fontWeight(.heavy)
                                Text(model.status ?? "")
                                    .fontWeight(.light)
                            }
                            .foregroundColor(.black)
                            .background(.regularMaterial)
                }
                )
                
        }.frame(width: 150,height: 220)            
        
        
    }
}




