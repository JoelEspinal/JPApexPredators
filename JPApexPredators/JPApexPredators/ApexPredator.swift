//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Joel Espinal (JoelEspinal) on 22/5/24.
//

import Foundation

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}
