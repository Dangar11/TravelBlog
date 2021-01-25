//
//  RestaurantDetailsView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailsView: View {
    
    let restaurant: RestraurantModel
    
    var body: some View {
        ScrollView {
            
            TopDescriptionView(restaurant: restaurant)
            
            LocationDescriptionView(restaurant: restaurant)
            
            PopularDishesView(restaurant: restaurant)
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}


struct TopDescriptionView: View {
    
    let restaurant: RestraurantModel
    
    var body: some View {
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
    }
    
}


struct LocationDescriptionView: View {
    
    let restaurant: RestraurantModel
    
    @ObservedObject var vm = RestaurantDetailsViewModel()
    
    var body: some View {
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
            
            Text(vm.details?.description ?? "")
//                .frame(height: 200) // specify for long text
                .font(.system(size: 14, weight: .light, design: .monospaced))
        }
        .padding()
    }
}



struct PopularDishesView: View {
    
    let restaurant: RestraurantModel
    
    @ObservedObject var vm = RestaurantDetailsViewModel()
    
    var body: some View {
        HStack {
            Text("Popular Dishes")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
            Spacer()
        }.padding(.horizontal)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(vm.details?.popularDishes ?? [], id: \.self) { popularDishes in
                    VStack(alignment: .leading) {
                        ZStack(alignment: .bottomLeading){
                            KFImage(URL(string: popularDishes.photo))
                                .resizable()
                                .scaledToFill()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                                .shadow(radius: 2)
                            
                            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white]), startPoint: .center
                                           , endPoint: .bottom)
                                .luminanceToAlpha()
                            
                            Text(popularDishes.price)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                                .padding([.leading, .bottom], 8)
                        }
                        .frame(height: 100)
                        .cornerRadius(10)
                        
                        
                        Text(popularDishes.name)
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                        Text( "\(popularDishes.numPhotos) photos")
                            .font(.system(size: 12, weight: .light, design: .monospaced))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.leading)
            .padding(.bottom)
        }
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