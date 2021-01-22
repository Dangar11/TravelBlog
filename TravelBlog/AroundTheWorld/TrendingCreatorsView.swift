//
//  TrendingCreators.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
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


struct TrendingCreators_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
