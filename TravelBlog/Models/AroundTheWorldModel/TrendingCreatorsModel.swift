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
}



struct TrendingCreators {
    
    var trendingCreators: [TrendingCreatorsModel] = [.init(name: "Joe Biden", image: "biden", rating: 2, date: Date(timeIntervalSinceNow: 36000), text: JoeBidenReview().text),
                                                     .init(name: "Donald Trump", image: "trump", rating: 5, date: Date(timeIntervalSinceNow: 360000), text: DonaldTrumpReview().text),
                                                     .init(name: "Barack Obama", image: "obama", rating: 4, date: Date(timeIntervalSinceNow: 3600000), text: BarackObamaReview().text),
                                                     .init(name: "George W. Bush", image: "bush", rating: 5, date: Date(timeIntervalSinceNow: 560000), text: GeorgeBushReview().text)]
    
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

