//
//  RestaurantPhotosView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import SwiftUI

struct RestaurantPhotosView: View {
    
    
    @State var mode = "list"
    
    init() {
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            
            ScrollView {
                
                Picker("Test", selection: $mode) {
                    Text("Grid").tag("grid")
                    Text("List").tag("list")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                
                if mode == "grid" {
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
                } else {
                    ForEach(0..<15, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 8) {
                            Image("biden")
                                .resizable()
                                .scaledToFill()
                            HStack {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.left")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }
                            .padding(.horizontal, 8)
                            Text("Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure ")
                                .font(.system(size: 14, weight: .light, design: .rounded))
                                .padding(.horizontal, 8)
                            
                            Text("Posted on November 4 2012")
                                .font(.system(size: 12, weight: .light, design: .rounded))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 8)
                        }
                        .padding(.bottom)
                }
            }
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
