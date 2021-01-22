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


class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Int]()
    
    init() {
        //networking
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
        }
        
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            DispatchQueue.main.async {
                self.places.append(1)
            }
        }
        
    }
    
}



struct CategoryDetailsView: View {
    
    //    @State var isLoading = false
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    
    var body: some View {
        
        
        ZStack {
            if vm.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                    .accentColor(Color(.black))
                    .foregroundColor(.blue)
                    .scaleEffect(1.5)
            } else {
                ScrollView {
                    ForEach(vm.places, id: \.self) { num in
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
            }
        }
        .navigationBarTitle("Category", displayMode: .inline)
        
    }
}


struct DiscoverCategorisView_Previews: PreviewProvider {
    static var previews: some View {
        //        AroundTheWorldView()
        NavigationView {
            CategoryDetailsView()
        }
        
    }
}
