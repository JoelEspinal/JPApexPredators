//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Joel Espinal (ClaroDom) on 28/5/24.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    
    let predator: ApexPredator
    @State var position: MapCameraPosition
    
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
                    NavigationLink {
                        Image(predator.image)
                            .resizable()
                        
                    } label: {
                    Map(position: $position) {
                        Annotation(predator.name,
                                   coordinate: predator.location) {
                            Image(systemName:
                                    "mappin.and.ellipse")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .symbolEffect(.pulse)
                            
                        }
                                   .annotationTitles(.hidden)
                    }
                    .frame(height: 125)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.top)
                }
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
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
                
                
                // Appears in
                
            }
            .ignoresSafeArea()
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    NavigationStack {
        PredatorDetail(predator: Predators()
                    .apexPredators[2],
                       position: .camera(
                        MapCamera(
                            centerCoordinate: Predators()
                                .apexPredators[2].location,
                            distance: 30000)
                       )
        )
        .preferredColorScheme(.dark)
    }
}
 
