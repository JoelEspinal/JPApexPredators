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
                
                // current location
                
                // Appears in
                
                // movie moment
                
                // Link to webpagee
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[0])
        .preferredColorScheme(.light)
}
 
