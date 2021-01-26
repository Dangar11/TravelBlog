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
            .padding(.bottom)
            
            ForEach(0..<10, id: \.self) { num in
                VStack(alignment: .leading) {
                    Image("paris")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                    
                    HStack {
                        Image("biden")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Here is my post")
                                .font(.system(size: 14, weight: .regular, design: .rounded))
                            Text("500k views")
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .foregroundColor(Color(.lightGray))
                        }
                        
                    }
                    .padding(.horizontal, 6)
                    
                    HStack{
                        ForEach(0..<3, id: \.self) { num in
                            Text("#Traveling")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                                .cornerRadius(20)
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .foregroundColor(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                        }
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 6)
                    
                }
//                .frame(height: 200)
                .background(Color(white: 1))
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
