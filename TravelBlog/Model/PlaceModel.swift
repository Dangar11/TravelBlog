//
//  PlacesModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 21.01.2021.
//

import Foundation

struct PlaceModel: Hashable {
    let country: String
    let cityName: String
    let cityImage: String
}


struct Places {
    
    let popularPlaces = [ PlaceModel(country: "France", cityName: "Paris", cityImage: "paris"),
                          PlaceModel(country: "Japan", cityName: "Tokyo", cityImage: "japan"),
                          PlaceModel(country: "Ukraine", cityName: "Kiev", cityImage: "kiev"),
                          PlaceModel(country: "Canada", cityName: "Vacouver", cityImage: "vancouver"),
                          PlaceModel(country: "USA", cityName: "New York", cityImage: "new_york")]
    
}
