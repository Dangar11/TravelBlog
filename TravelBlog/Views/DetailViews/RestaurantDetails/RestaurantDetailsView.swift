//
//  RestaurantDetailsView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    let restaurant: RestraurantModel
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white]), startPoint: .center
                               , endPoint: .bottom)
                    .luminanceToAlpha()

                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                        
                        HStack {
                            ForEach(0..<5, id: \.self) { stars in
                                Image(systemName: "star.circle")
                            }
                            .foregroundColor(.orange)
                        }
                    }
                    Spacer()
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .light, design: .monospaced))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
            }
            
                VStack(alignment: .leading, spacing: 10) {
                    Text("Location Description")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                    
                    Text("\(restaurant.countryPlace)")
                        .font(.system(size: 16, weight: .light, design: .monospaced))
                    
                    HStack {
                        ForEach(0..<3, id: \.self) { stars in
                            Image(systemName: "dollarsign.square.fill")
                        }
                        .foregroundColor(.orange)
                    }
                    
                    Text(LoremIpsum.loremIpsum)
                        .frame(height: 200)
                        .font(.system(size: 14, weight: .light, design: .monospaced))
                }
                .padding()
            
            HStack {
                Text("Popular Dishes")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { list in
                        VStack(alignment: .leading) {
                            Image(restaurant.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                .shadow(radius: 2)
                            
                            Text("Japanese Tapas")
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                            Text("88 Photos")
                                .font(.system(size: 12, weight: .light, design: .monospaced))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.leading)
                .padding(.bottom)
            }
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}



struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            
            RestaurantDetailsView(restaurant: RestraurantModel(name: "Hide", rank: "4,5 • European • $$$", countryPlace: "London, UK", image: "hide"))
        }
        
        AroundTheWorldView()
    }
}
