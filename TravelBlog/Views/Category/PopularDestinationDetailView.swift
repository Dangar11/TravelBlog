//
//  Destination.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailView: View {
    
    let places: PlaceModel
    //Map Coordinate
    @State var coordinateRegion: MKCoordinateRegion
    
    init(places: PlaceModel) {
        self.places = places
        self._coordinateRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: places.coordinate.latitude,
                                                                                                      longitude: places.coordinate.longtitude),
                                                                       span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    }
    
    var body: some View {
        ScrollView {
            Image(places.cityImage)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            VStack(alignment: .leading, spacing: 4) {
                Text(places.country)
                    .font(.system(size: 18, weight: .semibold, design: .monospaced))
                Text(places.cityName)
                    .font(.system(size: 14, weight: .light, design: .monospaced))
                HStack { Spacer() }
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.circle")
                            .foregroundColor(.orange)
                    }
                }
                
                Text(LoremIpsum.loremIpsum)
                    .padding(.top, 8)
                        .font(.system(size: 14, weight: .thin, design: .monospaced))
                Spacer()
                HStack {
                    Text("Location")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                    Spacer()
                }
                Map(coordinateRegion: $coordinateRegion)
                    .frame(height: 200)
                    .cornerRadius(15)
                    .padding([.top, .bottom], 15)
                
                    
            }
            .padding(.horizontal)
            
            
            
        }
        .navigationBarTitle("\(places.cityName)", displayMode: .inline)
        
    }
}

struct Destination_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                    PopularDestinationDetailView(places: PlaceModel(country: "Ukraine", cityName: "Kiev", cityImage: "kiev", coordinate: PlaceCoordinate(latitude: 37.0902, longtitude: 95.7129)))
            
        }
    }
}
