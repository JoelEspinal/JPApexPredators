//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Joel Espinal (ClaroDom) on 22/5/24.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    var body: some View {
        List(predators.apexPredators) { predator in
            Text(predator.name)
        }
    }
}

#Preview {
    ContentView()
}

    
