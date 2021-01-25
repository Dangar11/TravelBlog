//
//  File.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import Foundation


class RestaurantDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    
    @Published var details: RestaurantDetails?
    
    
    
    let creators = TrendingCreators()
    
    init() {
   
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    
                    self.details = try JSONDecoder().decode(RestaurantDetails.self, from: data)
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            
        }
        .resume()
    }
    
}
