import SwiftUI
import Foundation

struct CharacterPage: View {
    @State private var isDetailViewActive = false
    @StateObject var characterVC = CharacterViewViewModel()
    var singleCharacterModel = SingleCharacterModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Rick And Morty Character")
                        .fontWeight(.bold)
                        .font(.title)
                    Text("Aramak istediğiniz karakterin numarasını giriniz.")
                        .font(.subheadline)
                    TextField("", text: $characterVC.no)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal)
                    HStack {
                        Button(action: {
                            characterVC.fetchSingleCharacter()
                            isDetailViewActive = true
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
                            characterVC.fetchAllCharacters()
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
                    if characterVC.characters != [] {
                        LazyVGrid(columns: [
                            GridItem(.fixed(200)),
                            GridItem(.fixed(200))
                        ], content: {
                            ForEach(characterVC.characters, id: \.id) { character in
                                NavigationLink(destination: CharacterDetailView()) {
                                    PreviewCharacterBox(model: character)
                                }
                            }
                        })
                    }
                }

            }
            .padding()
        }
    }
}
