//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Joel Espinal (ClaroDom) on 28/5/24.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    // Dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                // Dino name
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    Text("Appear in: ")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self){ movie in
                        Text("." + movie)
                            .font(.subheadline)
                    }
                    // movie moment
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // Link to webpagee
                    
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                    
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
                
                // current location
                
                // Appears in
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[0])
        .preferredColorScheme(.light)
}
 