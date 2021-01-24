//
//  ParisImageModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 24.01.2021.
//

import Foundation


struct ParisImageModel {
    let image: String
}


struct ParisImage {
    
    let images:[ParisImageModel] = [.init(image: "paris-art-1"),
                                    .init(image: "paris-art-2"),
                                    .init(image: "paris-art-3"),
                                    .init(image: "paris-art-4"),
                                    .init(image: "paris-art-5")]
    
}


