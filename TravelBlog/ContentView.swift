//
//  ContentView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 20.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    //Title for all screens
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color(.init(white: 0.9, alpha: 1))
                    .offset(y:400)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: "magnifyingglass.circle")
                        Text("Place to go...")
                        Spacer()
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1.0, alpha: 0.3)))
                    .cornerRadius(16)
                    .padding(16)
                    
                    DiscoverCategoriesView()
                    
                    VStack {
                        
                        PopularDestinationView()
                        
                        PopularPlacesToEat()
                        
                        TrendCreators()
                    }
                    .background(Color(.init(white: 0.9, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top, 32)
                    
                    
                }
            }
            .navigationTitle("Around The World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - 1.0
struct DiscoverCategoriesView: View {
    
    let categoriesList = CategoryList().categories
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categoriesList, id: \.self) { category in
                    VStack(spacing: 4){
                        Image(systemName: category.imageName)
                            .foregroundColor(Color(#colorLiteral(red: 0.3990089893, green: 0.5306997299, blue: 0.6986097097, alpha: 1)))
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .cornerRadius(64)
                            .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 64)
                    
                }
                
            }.padding(.horizontal)
        }
    }
}


//MARK: - 2.0
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
                                
                            Text(places.country)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color(UIColor.gray))
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                
                        }
                        .background(Color(.white))
                            .cornerRadius(5)
                        .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}

//MARK: 3.0
struct PopularPlacesToEat: View {
    
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
                        .background(Color(.white))
                            .cornerRadius(5)
                            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
                            .padding(.bottom)
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}

//MARK: 4.0
struct TrendCreators: View {
    
    let trendingCreators = TrendingCreators().trendingCreators
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                Spacer()
                Text("See all")
            }
            .padding(.horizontal)
            .font(.system(size: 12, weight: .semibold))
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top,spacing: 8.0) {
                    ForEach(trendingCreators, id: \.self) { creator in
                        VStack {
                            Image(creator.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(30)
                                .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
                            Text(creator.name)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                
                        }
                        .frame(width: 70)
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}

