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
    
    init(name: String) {
        
        //networking
        
        let urlString =  "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        guard let url = URL(string: urlString) else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { [weak self] (data, resp, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let statusCode = (resp as? HTTPURLResponse)?.statusCode,
                   statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad Request Status: \(statusCode)"
                    return
                }
            }
            
            
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let artData = try JSONDecoder().decode([ArtModel].self, from: data)
                        self.places = artData
                } catch let error {
                    print("Failed to decode JSON:", error.localizedDescription)
                        self.errorMessage = error.localizedDescription
                }
            self.isLoading = false
            }
            
             
        
           
        }
        .resume()
        
    }
}
