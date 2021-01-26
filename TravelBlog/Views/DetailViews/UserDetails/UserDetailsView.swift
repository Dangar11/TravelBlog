//
//  UserDetailsView.swift
//  TravelBlog
//
//  Created by Igoro4ka on 26.01.2021.
//

import SwiftUI
import Kingfisher

struct UserDetailsView: View {
    
    let creator: TrendingCreatorsModel
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        ZStack {
            
            Color.defaultBackground.ignoresSafeArea()
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                
                
                TopProfileView(creator: creator)
                 
                ContactsButtonsView()
                
                ForEach(creator.post, id: \.self) { post in
                    PostCardsView(post: post)
                }

                }
                .ignoresSafeArea()
                .padding(.top)
                .padding(.horizontal, 20)
                .navigationBarTitle(creator.name, displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: { presentation.wrappedValue.dismiss() }) {
                  Image(systemName: "chevron.left")
                    .foregroundColor(Color.backButton)
                    .imageScale(.large)
                })
                .background(Color.defaultBackground)

        }
        
        }
    
        
        
    
}

struct TopProfileView: View {
    
    let creator: TrendingCreatorsModel
    
    var body: some View {
        VStack(spacing: 2) {
            Image(creator.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(Circle())
                .shadow(radius: 5)
                .padding(.horizontal)
                
            
            Text(creator.name)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
        }
        
        HStack {
            Text("\(creator.profile.nickname)")
            Image(systemName: "hand.thumbsup")
            Text("\(creator.profile.likeCount)")
        }
        .padding(8)
        .font(.system(size: 14, weight: .light, design: .rounded))
        
        Text(creator.profile.interesting)
            .font(.system(size: 14, weight: .light, design: .monospaced))
            .foregroundColor(Color(.lightGray))
        
        
        HStack() {
            VStack {
                Text(creator.profile.followers)
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
                Text(creator.profile.following)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                Text("Following")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(.lightGray))
            }
        }
        .padding()
    }
    
}

struct ContactsButtonsView: View {
    var body: some View {
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
    }
}

struct PostCardsView: View  {
    
    @Environment(\.colorScheme) var colorScheme

    let post: TrandingCreatorPost

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: post.photoPost))
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            HStack {
                Image("biden")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.postText)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                    Text(post.viewCount)
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .foregroundColor(Color(.lightGray))
                }
                
            }
            .padding(.horizontal, 6)
            
            HStack{
                ForEach(post.hashTags, id: \.self) { hashtags in
                    Text("#\(hashtags)")
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
        .background(Color.tile)
        .cornerRadius(10)
        .shadow(color: .init(white: colorScheme == .light ? 0.8 : 0), radius: 5, x: 0, y: 4)
    }

}


struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(creator: .init(name: "Joe Biden", image: "biden", rating: 5, date: Date(timeIntervalSinceNow: 100000), text: "Fuck all", profile: .init(nickname: "@joeBiden", interesting: "Traveling, Business, Economy", likeCount: 1540, followers: "59,123", following: "4", postsImage: ""), post: JoeBidenPost().post))
                .colorScheme(.dark)
        }
    }
}
