import Foundation

// MARK: - CharacterModel
struct SingleCharacterModel:Codable,Equatable {
    var id: Int?
    var name, status, species, type: String?
    var gender: String?
    var origin, location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

// MARK: - Location
struct Location:Codable,Equatable {
    var name: String?
    var url: String?
}
