//
//  DestinationHeaderContainer.swift
//  TravelBlog
//
//  Created by Igoro4ka on 24.01.2021.
//

import SwiftUI


struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let customPageViewController = CustomPageViewController()
        return customPageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}




struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
        NavigationView {
                    PopularDestinationDetailView(places: PlaceModel(country: "France", cityName: "Paris", cityImage: "paris", coordinate: PlaceCoordinate(latitude: 48.859565, longtitude: 2.353235)))
        }
    }
}
