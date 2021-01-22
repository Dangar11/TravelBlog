//
//  TrendingCreatorsModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import Foundation



struct TrendingCreatorsModel: Hashable {
    var name: String
    var image: String
}



struct TrendingCreators {
    
    var trendingCreators: [TrendingCreatorsModel] = [.init(name: "Vladimir Putin", image: "putin"),
                                                     .init(name: "Evgeniy Chichvarkin", image: "chichvarkin"),
                                                     .init(name: "Dmitriy Gordon", image: "gordon"),
                                                     .init(name: "Alexey Navalniy", image: "navalniy")]
    
}
