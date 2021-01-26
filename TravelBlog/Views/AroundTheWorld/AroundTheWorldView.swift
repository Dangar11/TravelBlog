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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
            
            Color.defaultBackground.ignoresSafeArea(.all)
            
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
                        .ignoresSafeArea(.all)
                        .background(Color.defaultBackground)
                        .cornerRadius(16)
                        .padding(.top, 32)
                    }
                    
                }
                .navigationTitle("Around The World")
                .navigationBarBackButtonHidden(true)
            }
        }
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AroundTheWorldView()
            .colorScheme(.dark)
        AroundTheWorldView()
            .colorScheme(.light)
    }
}




