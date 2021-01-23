//
//  LazyLoadingViews.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
    
}
