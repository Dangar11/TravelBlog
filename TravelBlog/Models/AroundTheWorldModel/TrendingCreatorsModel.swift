//
//  TrendingCreatorsModel.swift
//  TravelBlog
//
//  Created by Igoro4ka on 22.01.2021.
//

import Foundation



struct TrendingCreatorsModel: Hashable {
    let name: String
    let image: String
    let rating: Int
    let date: Date
    let text: String
    let profile: TrandingCreatorProfile
    let post: [TrandingCreatorPost]
    
}

struct TrandingCreatorProfile: Hashable {
    let nickname: String
    let interesting: String
    let likeCount: Int
    let followers: String
    let following: String
    let postsImage: String
}

struct TrandingCreatorPost: Hashable {
    let postText: String
    let viewCount: String
    let hashTags: [String]
    let photoPost: String
}



struct TrendingCreators {
    
    let trendingCreators: [TrendingCreatorsModel] = [.init(name: "Joe Biden", image: "biden", rating: 2, date: Date(timeIntervalSinceNow: 36000), text: JoeBidenReview().text, profile: JoeBidenProfile().profile, post: JoeBidenPost().post ),
                                                     .init(name: "Donald Trump", image: "trump", rating: 5, date: Date(timeIntervalSinceNow: 360000), text: DonaldTrumpReview().text, profile: DonaldTrampProfile().profile, post: DonaldTrumpPost().post),
                                                     .init(name: "Barack Obama", image: "obama", rating: 4, date: Date(timeIntervalSinceNow: 3600000), text: BarackObamaReview().text, profile: BarackObamaProfile().profile, post: BarackObamaPost().post),
                                                     .init(name: "George W. Bush", image: "bush", rating: 5, date: Date(timeIntervalSinceNow: 560000), text: GeorgeBushReview().text, profile: GeorgeBushProfile().profile, post: GeorgeBushPost().post)]
}




struct JoeBidenPost {
    
    let post: [TrandingCreatorPost] = [.init(postText: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own.",
                                             viewCount: "200K views", hashTags: ["park", "walking", "hicking"],
                                             photoPost: "https://images.unsplash.com/photo-1604905283384-8f874c6aed3e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJpZGVufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Folly words widow one downs few age every seven. If miss part by fact he park just shew.",
                                             viewCount: "100K views", hashTags: ["running", "sun"],
                                             photoPost: "https://images.unsplash.com/photo-1604696734281-950395e57c7a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjN8fGpvZSUyMGJpZGVufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Another journey chamber way yet females man. Way extensive and dejection get delivered deficient sincerity gentleman age.",
                                             viewCount: "1M views", hashTags: ["strugle", "usapresident"],
                                             photoPost: "https://images.unsplash.com/photo-1604900881719-6e3eecd1a983?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzN8fGpvZSUyMGJpZGVufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Village did removed enjoyed explain nor ham saw calling talking. Securing as informed declared or margaret. Joy horrible moreover man feelings own shy.",
                                             viewCount: "2M views", hashTags: ["machine", "welcome"],
                                             photoPost: "https://images.unsplash.com/photo-1604496464355-a5032e3b47e0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8am9lJTIwYmlkZW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")]
    
}

struct DonaldTrumpPost {
    
    let post: [TrandingCreatorPost] = [.init(postText: "In it except to so temper mutual tastes mother. Interested cultivated its continuing now yet are. Out interested acceptance our partiality affronting unpleasant why add.",
                                             viewCount: "200K views", hashTags: ["night", "economy", "mexican"],
                                             photoPost: "https://images.unsplash.com/photo-1550531996-ff3dcede9477?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dHJ1bXB8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Had denoting properly jointure you occasion directly raillery. In said to of poor full be post face snug.",
                                             viewCount: "400K views", hashTags: ["old", "expresidentusa"],
                                             photoPost: "https://images.unsplash.com/photo-1485309086598-f9d010ad3972?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8dHJ1bXB8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Improve ashamed married expense bed her comfort pursuit mrs. Four time took ye your as fail lady. Up greatest am exertion or marianne.",
                                             viewCount: "6M views", hashTags: ["follow", "twitter", "banned"],
                                             photoPost: "https://images.unsplash.com/photo-1512402088551-0a0cc2983e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8dHJ1bXB8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "You disposal strongly quitting his endeavor two settling him. Manners ham him hearted hundred expense. Get open game him what hour more part. Adapted as smiling of females oh me journey exposed concern.",
                                             viewCount: "200K views", hashTags: ["switch", "ride", "cars"],
                                             photoPost: "https://images.unsplash.com/photo-1589059214154-e8edfcc09e4a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fHRydW1wfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")]
    
}

struct BarackObamaPost {
    let post: [TrandingCreatorPost] = [.init(postText: "One advanced diverted domestic sex repeated bringing you old. Possible procured her trifling laughter thoughts property she met way. Companions shy had solicitude favourable own.",
                                             viewCount: "200K views", hashTags: ["switch", "ride", "cars"],
                                             photoPost: "https://images.unsplash.com/photo-1541872703-74c5e44368f9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8YmFyYWNrJTIwb2JhbWF8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Folly words widow one downs few age every seven. If miss part by fact he park just shew.",
                                             viewCount: "300K views", hashTags: ["road", "black", "usaalive"],
                                             photoPost: "https://images.unsplash.com/photo-1580130379624-3a069adbffc5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8b2JhbWF8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Another journey chamber way yet females man. Way extensive and dejection get delivered deficient sincerity gentleman age.",
                                             viewCount: "12M views", hashTags: ["fun", "bestpresidentusa"],
                                             photoPost: "https://images.unsplash.com/photo-1535902307019-63b3ca1577d0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8b2JhbWF8ZW58MHx8MHw%3D&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Village did removed enjoyed explain nor ham saw calling talking. Securing as informed declared or margaret. Joy horrible moreover man feelings own shy.",
                                             viewCount: "2M views", hashTags: ["covid19", "problem", "lockdown"],
                                             photoPost: "https://images.unsplash.com/photo-1518716578709-3094c410659f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTV8fG9iYW1hfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")]
}

struct GeorgeBushPost {
    let post: [TrandingCreatorPost] = [.init(postText: "In it except to so temper mutual tastes mother. Interested cultivated its continuing now yet are. Out interested acceptance our partiality affronting unpleasant why add.",
                                             viewCount: "100K views", hashTags: ["money", "property", "swimming"],
                                             photoPost: "https://images.unsplash.com/photo-1541872705-1f73c6400ec9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8Z2VvcmdlJTIwYnVzaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Had denoting properly jointure you occasion directly raillery. In said to of poor full be post face snug.",
                                             viewCount: "2M views", hashTags: ["fire", "explosion", "tv"],
                                             photoPost: "https://images.unsplash.com/photo-1580129958560-c5e47d47a677?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2VvcmdlJTIwYnVzaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "Improve ashamed married expense bed her comfort pursuit mrs. Four time took ye your as fail lady. Up greatest am exertion or marianne.",
                                             viewCount: "6M views", hashTags: ["morning", "running", "weather"],
                                             photoPost: "https://images.unsplash.com/photo-1551284425-d1794fb96476?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2VvcmdlJTIwYnVzaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"),
                                       .init(postText: "You disposal strongly quitting his endeavor two settling him. Manners ham him hearted hundred expense. Get open game him what hour more part. Adapted as smiling of females oh me journey exposed concern.",
                                             viewCount: "400K views", hashTags: ["ready", "taking", "trip"],
                                             photoPost: "https://images.unsplash.com/photo-1506794778225-cbf6c8df4c5c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8Z2VvcmdlJTIwYnVzaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60")]
    
}



struct JoeBidenProfile {
    
    let profile: TrandingCreatorProfile = .init(nickname: "@joeBiden", interesting: "Traveling, Business, Economy", likeCount: 1540, followers: "59,123", following: "4", postsImage: "")
    
    
}

struct DonaldTrampProfile {
    
    let profile: TrandingCreatorProfile = .init(nickname: "@trump.d", interesting: "Money, Business, Maxican", likeCount: 22450, followers: "3,200,154", following: "22", postsImage: "")
    
}

struct BarackObamaProfile {
    
    let profile: TrandingCreatorProfile = .init(nickname: "@barack.o", interesting: "Traveling, Family, Economy", likeCount: 15400, followers: "1,000,123", following: "15", postsImage: "")
    
}

struct GeorgeBushProfile {
    
    let profile: TrandingCreatorProfile = .init(nickname: "@george.w.b", interesting: "Cars, Business, Travel, Fishing", likeCount: 12300, followers: "169,432", following: "323", postsImage: "")
    
}



struct JoeBidenReview {
    
    let text = "Always have a dinner here, but for a last time i quite often see Donald Trump here, and after that, I never visit it's place again"
}

struct DonaldTrumpReview {
    
    let text = "This place is not for pure people but Joe Biden is quite often eating in that place, why he's not giving launch money for the charity"
    
}

struct BarackObamaReview {
    
    let text = "It's been a long time ago I'm eating my delisious steak, and this two come along and ruin my perfect dinner"
    
}

struct GeorgeBushReview {
    
    let text = "I know that, here comes a lot of people i don't like, but the food is so unbelivible, so I'm taking a delivery every evening"
}

