//
//  CategoryDetailsView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import SwiftUI
import Kingfisher


struct CategoryDetailsView: View {
    
    
    private let name: String
    @ObservedObject private var vm: CategoryDetailsViewModel
    
    init(name: String) {
        print("Loaded CategoryDetails View and making network request for \(name)")
        self.name = name
        self.vm = .init(name: name)
    }
    

    
    
    var body: some View {
        
        
        ZStack {
            if vm.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                    .accentColor(Color(.black))
                    .foregroundColor(.blue)
            } else {
                ZStack {
                    if !vm.errorMessage.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.square")
                                .font(.system(size: 64, weight: .semibold, design: .monospaced))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                        
                    }
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
        .navigationBarTitle(name, displayMode: .inline)
        
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(name: "Food")
    }
}
