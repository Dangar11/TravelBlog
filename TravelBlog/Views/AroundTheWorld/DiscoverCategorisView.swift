//
//  DiscoverCategorisView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import SwiftUI
import Kingfisher

struct DiscoverCategoriesView: View {
    
    let categoriesList = CategoryList().categories
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categoriesList, id: \.self) { category in
                    NavigationLink(
                        destination: NavigationLazyView(CategoryDetailsView(name: category.name)), // bug fix https://www.objc.io/blog/2019/07/02/lazy-loading/
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
                                    .fixedSize(horizontal: true, vertical: true)
                            }
                            .frame(width: 64)
                        })
                    
                }
                
            }.padding(.horizontal)
        }
    }
}




struct DiscoverCategorisView_Previews: PreviewProvider {
    static var previews: some View {
//        DiscoverCategoriesView()
        AroundTheWorldView()
    }
}
