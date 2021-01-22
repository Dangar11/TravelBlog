//
//  Category.swift
//  TravelBlog
//
//  Created by Igoro4ka on 20.01.2021.
//

import Foundation

//Hashable makes a unique identifier
struct Category: Hashable {
    let name: String
    let imageName: String
}



struct CategoryList {
    
     let categories = [Category(name: "Art", imageName: "music.quarternote.3"),
                                 Category(name: "Sport", imageName: "tortoise.fill"),
                                 Category(name: "Live Events", imageName: "livephoto.play"),
                                 Category(name: "Food", imageName: "eyes"),
                                 Category(name: "History", imageName: "clock.fill")]

}
