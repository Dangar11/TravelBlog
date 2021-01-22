//
//  PopularPlacesToEat.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import SwiftUI

struct PopularPlacesToEatView: View {
    
    let restaurants = Restaurant().restaurants
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Places to Eat")
                Spacer()
                Text("See all")
            }
            .padding(.horizontal)
            .font(.system(size: 12, weight: .semibold))
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(restaurants, id: \.self) { restaurant in
                        HStack(alignment: .top) {
                            Image(restaurant.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipped()
                                .cornerRadius(5)
                                .padding(.leading, 6)
                                .padding(.vertical, 6)
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(restaurant.name)
                                    Spacer()
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "circle.grid.cross")
                                    })
                                    .foregroundColor(.black)
                                    
                                }
                                .padding(.top, 5)
                                
                                HStack(spacing: 2) {
                                    Image(systemName: "star.circle")
                                    Text(restaurant.rank)
                                }
                                Text(restaurant.countryPlace)
                                    .foregroundColor(Color(UIColor.darkGray))
                                
                            }
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.leading, 4)
                            
                            Spacer()
                        }
                        .frame(width: 240)
                        .asTile() // TileModifier 
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}



struct PopularPlacesToEat_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlacesToEatView()
    }
}
