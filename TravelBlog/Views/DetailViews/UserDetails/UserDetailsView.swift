//
//  UserDetailsView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 26.01.2021.
//

import SwiftUI

struct UserDetailsView: View {
    
    let creator: TrendingCreatorsModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                Image(creator.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                
                Text(creator.name)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
            }
            
            HStack {
                Text("@biden2021 •")
                Image(systemName: "hand.thumbsup")
                Text("2541")
            }
            .padding(8)
            .font(.system(size: 14, weight: .light, design: .rounded))
            
            Text("President, Trevel Creator, Vlogger")
                .font(.system(size: 14, weight: .light, design: .monospaced))
                .foregroundColor(Color(.lightGray))
            
            
            HStack() {
                VStack {
                    Text("59,394")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                    Text("Followers")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(.lightGray))
                }
                
                Spacer()
                    .frame(width: 1, height: 20)
                    .background(Color(.lightGray))
                    .padding(.horizontal)
                
                VStack {
                    Text("2,112")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                    Text("Following")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(.lightGray))
                }
            }
            .padding()
            
            HStack(spacing: 16) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Spacer()
                        Text("Follow")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .cornerRadius(100)

                       
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Spacer()
                        Text("Contact")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .background(Color(.init(white: 0.9, alpha: 1)))
                    .cornerRadius(100)
                })
            }
            .padding(.horizontal)
            
            ForEach(0..<10, id: \.self) { num in
                HStack {
                    Spacer()
                }
                .frame(height: 200)
                .background(Color(white: 0.8))
                .cornerRadius(10)
                .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                .padding(.horizontal)
            }
        
            
            }
        .navigationBarTitle(creator.name, displayMode: .inline)
        
    }
    
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(creator: .init(name: "Joe Biden", image: "biden", rating: 5, date: Date(timeIntervalSinceNow: 100000), text: "Fuck all"))
        }
    }
}
