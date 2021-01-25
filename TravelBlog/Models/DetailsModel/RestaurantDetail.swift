//
//  RestaurantDetail.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import Foundation


struct RestaurantDetails: Decodable {
    let description: String
    let popularDishes: [PopularDishes]
}


struct PopularDishes: Decodable, Hashable {
    let name: String
    let price: String
    let photo: String
    let numPhotos: Int
}
