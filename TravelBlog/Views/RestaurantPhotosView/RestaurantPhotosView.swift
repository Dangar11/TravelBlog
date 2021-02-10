//
//  RestaurantPhotosView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 25.01.2021.
//

import SwiftUI
import Kingfisher

struct RestaurantPhotosView: View {
    
    @Environment(\.presentationMode) var presentation
    
    let photos = FoodDetails().photos
    
    
    @State var mode = "grid"
    @State var showFullScreenModal = false
    @State var selectedPhotoIndex = 0
    
    init() {
        UISegmentedControl.appearance().backgroundColor = .gray
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
    }
    
    
    var body: some View {
        
        GeometryReader { proxy in
            
            ScrollView {
                
                Picker("Test", selection: $mode) {
                    Text("Grid").tag("grid")
                    Text("List").tag("list")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                FullScreenView(photos: photos, showFullScreenModal: $showFullScreenModal, selectedPhotoIndex: $selectedPhotoIndex)
                
                if mode == "grid" {
                    GridViewCell(proxy: proxy, photos: photos, showFullScreenModal: $showFullScreenModal, selectedPhotoIndex: $selectedPhotoIndex)
                } else {
                    ListViewCell(photos: photos)
                }
            }
        }
        .navigationBarTitle("All Photos", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image(systemName: "chevron.left")
                .foregroundColor(Color.backButton)
                .imageScale(.large)
            })
        
    }
}


struct FullScreenView: View {
    
    let photos: [String]
    @Binding var showFullScreenModal: Bool
    @Binding var selectedPhotoIndex: Int
    
    var body: some View {
        Spacer()
            .fullScreenCover(isPresented: $showFullScreenModal, content: {
                ZStack(alignment: .topLeading) {
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(alignment: .center) {
                        Spacer()
                        DestinationHeaderContainer(selectedIndex: selectedPhotoIndex, imagesURLString: photos)
                            .scaledToFit()
                        Spacer()
                    }
                    
                    
                    Button(action: {
                        showFullScreenModal.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    })
                }
            })
            .opacity(showFullScreenModal ? 1: 0)
    }
    
}


struct GridViewCell: View {
    
    let proxy: GeometryProxy
    let photos: [String]
    @Binding var showFullScreenModal: Bool
    @Binding var selectedPhotoIndex: Int
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: proxy.size.width / 3 - 3, maximum: 300), spacing: 2)
        ], alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 4, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
            
            ForEach(photos, id: \.self) { num in
                
                Button(action: {
                    self.selectedPhotoIndex = photos.firstIndex(of: num) ?? 0
                    self.showFullScreenModal.toggle()
                }, label: {
                    KFImage(URL(string: num))
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                })
            }
            
            
        })
        .padding(.horizontal, 2)
    }
    
}

struct ListViewCell: View {
    
    let photos: [String]
    
    var body: some View {
        ForEach(photos, id: \.self) { num in
            VStack(alignment: .leading, spacing: 8) {
                KFImage(URL(string: num))
                    .resizable()
                    .scaledToFill()
                HStack {
                    Image(systemName: "heart")
                    Image(systemName: "bubble.left")
                    Image(systemName: "paperplane")
                    Spacer()
                    Image(systemName: "bookmark")
                }
                .padding(.horizontal, 8)
                Text("Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure Description for post here it goes and leave it forever. Make sure ")
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .padding(.horizontal, 8)
                
                Text("Posted on November 4 2012")
                    .font(.system(size: 12, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
            }
            .padding(.bottom)
    }
    }
    
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            RestaurantPhotosView()
        }
        
        
    }
}
