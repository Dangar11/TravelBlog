//
//  MapAttractionModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import Foundation


struct MapAttractionModel:  Identifiable {
    var id = UUID().uuidString
    
    let name: String
    let lattitude: Double
    let longtitude: Double
}


struct Attraction {
    let attractions: [MapAttractionModel] = [.init(name: "Eiffel Tower", lattitude: 48.85908905552732, longtitude: 2.2945092129628284),
                                             .init(name: "Champs-Elysees", lattitude: 48.866867, longtitude: 2.311780),
                                                .init(name: "Louvre Museum", lattitude: 48.860288, longtitude: 2.337789)]
}


