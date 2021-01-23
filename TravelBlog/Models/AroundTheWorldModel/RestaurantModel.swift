//
//  RestaurantModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 21.01.2021.
//

import Foundation


struct RestraurantModel: Hashable {
    let name: String
    let rank: String
    let countryPlace: String
    let image: String
}



struct Restaurant {
    let restaurants = [RestraurantModel(name: "Chez Mari", rank: "4,8 • Cruasant • $$", countryPlace: "Paris, France", image: "restraurantFrance"),
                       RestraurantModel(name: "Hide", rank: "4,5 • European • $$$", countryPlace: "London, UK", image: "hide")]
}
