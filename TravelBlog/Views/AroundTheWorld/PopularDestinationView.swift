//
//  PopularDestionationView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import SwiftUI

struct PopularDestinationView: View {
    
    let popularPlaces = Places().popularPlaces
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                Spacer()
                Text("See all")
            }
            .padding(.horizontal)
            .font(.system(size: 12, weight: .semibold))
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(popularPlaces, id: \.self) { places in
                        NavigationLink(
                            destination: PopularDestinationDetailView(places: places),
                            label: {
                                PopularDestanationRow(places: places)
                                    .padding(.bottom)
                            })
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}


//MARK: - ROW
struct PopularDestanationRow: View {
    
    let places: PlaceModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(places.cityImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .padding(.horizontal, 4)
                .padding(.vertical, 4)
            
            
            Text(places.cityName)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(places.country)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color(UIColor.gray))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
            
        }
        .asTile() // TileModifier
    }
}






struct PopularDestionationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationView()
        }
        AroundTheWorldView()
        
        
    }
}
