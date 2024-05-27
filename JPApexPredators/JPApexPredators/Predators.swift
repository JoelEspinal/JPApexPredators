//
//  Predators.swift
//  JPApexPredators
//
//  Created by Joel Espinal (JoelEspinal) on 22/5/24.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return self.apexPredators
        } else {
            return self.apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
}
