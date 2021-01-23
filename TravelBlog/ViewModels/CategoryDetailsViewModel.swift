//
//  File.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import Foundation


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
                self.isLoading = false
            } catch let error {
                print("Failed to decode JSON:", error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
            
            
        }
        .resume()
        
    }
}
