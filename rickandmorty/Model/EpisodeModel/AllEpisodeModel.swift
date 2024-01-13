import Foundation

import Foundation

struct AllEpisodeModel:Codable{
    var info: info?
    var results: [EpisodeModel]?
}

struct info:Codable{
    var count, pages: Int?
    var next: String?
}



