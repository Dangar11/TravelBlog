//
//  ContentView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 20.01.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                DiscoverCategoriesView()
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

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<15, id: \.self) { num in
                    VStack(spacing: 4){
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
                        Text("Art")
                    }
                    
                }
                
            }.padding(.horizontal)
        }
    }
}
