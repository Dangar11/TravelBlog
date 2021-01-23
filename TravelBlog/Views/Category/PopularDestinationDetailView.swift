//
//  Destination.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import SwiftUI

struct PopularDestinationDetailView: View {
    
    let places: PlaceModel
    
    var body: some View {
        ScrollView {
            Image(places.cityImage)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            VStack(alignment: .leading, spacing: 4) {
                Text(places.country)
                    .font(.system(size: 18, weight: .semibold, design: .monospaced))
                Text(places.cityName)
                    .font(.system(size: 14, weight: .light, design: .monospaced))
                HStack { Spacer() }
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.circle")
                            .foregroundColor(.orange)
                    }
                }
                
                Text(LoremIpsum.loremIpsum)
                    .padding(.top, 8)
                        .font(.system(size: 16, weight: .thin, design: .monospaced))
                HStack { Spacer() }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("\(places.cityName)", displayMode: .inline)
        
    }
}

struct Destination_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                    PopularDestinationDetailView(places: PlaceModel(country: "Ukraine", cityName: "Kiev", cityImage: "kiev"))
            
        }
    }
}
