//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Joel Espinal (ClaroDom) on 22/5/24.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(predators.apexPredators) { predator in
                NavigationLink {
                    Image(predator.image)
                } label: {
                HStack {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100.0, height: 100.0)
                        .shadow(color: .white, radius: 1)
                    VStack(alignment: .leading) {
                        Text(predator.name)
                            .fontWeight(.bold)
                        Text(predator.type.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal, 13)
                            .padding(.vertical, 5)
                            .background(predator.type.background)
                            .clipShape(.capsule)
                    }
                }
            }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}

    
