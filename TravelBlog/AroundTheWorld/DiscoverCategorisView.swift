//
//  DiscoverCategorisView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    let categoriesList = CategoryList().categories
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categoriesList, id: \.self) { category in
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
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
                        })
                    
                }
                
            }.padding(.horizontal)
        }
    }
}

struct CategoryDetailsView: View {
    
    
    var body: some View {
        ScrollView {
            ForEach(0..<5, id: \.self) { num in
                VStack(alignment: .leading, spacing: 0){
                    Image("canada_night")
                        .resizable()
                        .scaledToFill()
                        
                   Text("Demo123")
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    .padding()
                }
                .asTile()
                .padding()
            }
        }
        .navigationBarTitle("Category", displayMode: .inline)
        
    }
}

struct DiscoverCategorisView_Previews: PreviewProvider {
    static var previews: some View {
        AroundTheWorldView()
        NavigationView {
            CategoryDetailsView()
        }
       
        
//        ZStack {
//            Color.gray
//            DiscoverCategoriesView()
//        }
        
    }
}
