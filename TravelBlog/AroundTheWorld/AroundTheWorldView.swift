//
//  ContentView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 20.01.2021.
//

import SwiftUI



struct AroundTheWorldView: View {
    
    //Title for all screens
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color.aroundTheWorldBackground
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
                        
                        PopularPlacesToEatView()
                        
                        TrendingCreatorsView()
                    }
                    .background(Color.aroundTheWorldBackground)
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
        AroundTheWorldView()
    }
}




