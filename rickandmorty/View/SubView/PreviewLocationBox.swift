//
//  PreviewLocationBox.swift
//  rickandmorty
//
//  Created by Muhammet Ali Yahyaoğlu on 22.12.2023.
//

import Foundation
import SwiftUI

struct PreviewLocationBox:View{
    var name:String = ""
    var imageURL:String=""
    var body:some View{
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                CircleAvatar(imageURL: imageURL)
                CircleAvatar(imageURL: imageURL)
                CircleAvatar(imageURL: imageURL)
                CircleAvatar(imageURL: imageURL)
                CircleAvatar(imageURL: imageURL)
                CircleAvatar(imageURL: imageURL)

            }
            .padding()
        }

        
    }
}

#Preview{ 
    PreviewLocationBox()
}
   

struct CircleAvatar: View {
    var imageURL:String=""
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { phase in
            switch phase {
            case .empty:
                Text("Yükleniyor")
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
        .frame(width:80, height: 50)
    }
}
