//
//  TileModifier.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color(.white))
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 2)
        
    }
    
}
