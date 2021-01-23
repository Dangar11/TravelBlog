//
//  CategoryDetailsView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import SwiftUI
import Kingfisher


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
                                KFImage(URL(string: place.thumbnail))
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

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView()
    }
}
