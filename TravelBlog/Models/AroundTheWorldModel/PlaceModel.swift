//
//  PlacesModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 21.01.2021.
//

import Foundation
import CoreLocation

struct PlaceModel: Hashable {
    let country: String
    let cityName: String
    let cityImage: String
    let coordinate: PlaceCoordinate
    let photoCountries: PhotoCountry
    let about: String
}

struct PlaceCoordinate: Hashable {
    let latitude: CLLocationDegrees
    let longtitude: CLLocationDegrees
}

struct PhotoCountry: Hashable {
    let urlString: [String]
}




struct Places {
    
    
    let popularPlaces = [ PlaceModel(country: "France", cityName: "Paris", cityImage: "paris", coordinate: PlaceCoordinate(latitude: 48.859565, longtitude: 2.353235), photoCountries: .init(urlString: ParisImage().images), about: ParisAbout().about ),
                          PlaceModel(country: "Japan", cityName: "Tokyo", cityImage: "japan", coordinate: PlaceCoordinate(latitude: 35.679693, longtitude: 139.771913), photoCountries: .init(urlString: TokyoImage().images), about: TokyoAbout().about),
                          PlaceModel(country: "Ukraine", cityName: "Kiev", cityImage: "kiev", coordinate: PlaceCoordinate(latitude: 50.45043286079094, longtitude: 30.534178747128127), photoCountries: .init(urlString: KievImage().images), about: UkraineAbout().about),
                          PlaceModel(country: "Canada", cityName: "Vacouver", cityImage: "vancouver", coordinate: PlaceCoordinate(latitude: 49.28024596895882, longtitude: -123.12066573011934), photoCountries: .init(urlString: CanadaImage().images), about: CanadaAbout().about),
                          PlaceModel(country: "USA", cityName: "New York", cityImage: "new_york", coordinate: PlaceCoordinate(latitude: 40.70764196864904, longtitude: -74.00977389957389), photoCountries: .init(urlString: USAImage().images), about: USAAbout().about)]
}



