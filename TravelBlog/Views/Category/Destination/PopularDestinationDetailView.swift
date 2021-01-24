//
//  PopularDestinationDetailView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 23.01.2021.
//

import SwiftUI
import MapKit



struct PopularDestinationDetailView: View {
    
    let places: PlaceModel
    
    let parisImage = ParisImage()
    //Map Coordinate

    
    init(places: PlaceModel) {
        self.places = places
    }
    

    
    var body: some View {
        ScrollView {
            DestinationHeaderContainer(imagesURLString: parisImage.images) // UIKit ViewController
                .frame(height: 250)
            
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
                
                MapViewModel(places: places) // MAPVIEW
                    
            }
            .padding(.horizontal)
            
            
            
        }
        .navigationBarTitle("\(places.cityName)", displayMode: .inline)
        
    }
}


struct MapViewModel: View {
    
    
    @State var coordinateRegion: MKCoordinateRegion
    @State var stateAttraction = true
    
    let attractions = Attraction()
    
    init(places: PlaceModel) {
        self._coordinateRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: places.coordinate.latitude,
                                                                                                      longitude: places.coordinate.longtitude),
                                                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        HStack {
            Text("Location")
                .font(.system(size: 18, weight: .bold, design: .monospaced))
            Spacer()
            Button(action: {
                stateAttraction.toggle()
            }, label: {
                Text("\(stateAttraction ? "Hide" : "Show") Attractions")
                    .font(.system(size: 14, weight: .thin, design: .monospaced))
            })
            Toggle("", isOn: $stateAttraction)
                .labelsHidden()
        }

        
        Map(coordinateRegion: $coordinateRegion, annotationItems: stateAttraction ? attractions.attractions : []) { attraction in
            MapAnnotation(coordinate: .init(latitude: attraction.lattitude, longitude: attraction.longtitude)) {
                CustomMapAnnotation(attraction: attraction)
            }
        }
        .frame(height: 200)
        .cornerRadius(15)
        .padding([.top, .bottom], 15)
    }
}


struct CustomMapAnnotation: View {
    
    let attraction: MapAttractionModel
    
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            Text(attraction.name)
                .font(.system(size: 14, weight: .thin, design: .monospaced))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(Color(.init(white: 0.0, alpha:3))))
        }
        .shadow(radius: 5)
    }
}



struct Destination_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                    PopularDestinationDetailView(places: PlaceModel(country: "France", cityName: "Paris", cityImage: "paris", coordinate: PlaceCoordinate(latitude: 48.859565, longtitude: 2.353235)))
            
        }
    }
}
