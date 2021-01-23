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
    @Published var places = [ArtModel]()
    
    @Published var errorMessage = ""
    
    init() {
        //networking
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, resp, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data, let self = self else { return }
            
            do {
                let artData = try JSONDecoder().decode([ArtModel].self, from: data)
                self.places = artData
                
            } catch let error {
                print("Failed to decode JSON:", error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
            
            self.isLoading = false
        }
        .resume()
       
        
    }
    
}



struct CategoryDetailsView: View {
    
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
                ZStack {
                    Text(vm.errorMessage)
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0){
                                Image("canada_night")
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                                    .padding()
                            }
                            .asTile()
                            .padding()
                        }
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
