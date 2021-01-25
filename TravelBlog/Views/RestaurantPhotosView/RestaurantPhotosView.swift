//
//  RestaurantPhotosView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        
        
        
        GeometryReader { proxy in
            
            ScrollView {
                
                LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: proxy.size.width / 3 - 3, maximum: 300), spacing: 2)
                ], alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
                    
                    ForEach(0..<15, id: \.self) { num in
                        Image("biden")
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                    }
                    
                    
                })
                .padding(.horizontal, 2)
                
                Text("Text")
            }
        }
        
        
        .navigationBarTitle("All Photos", displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            RestaurantPhotosView()
        }
    
        
    }
}
