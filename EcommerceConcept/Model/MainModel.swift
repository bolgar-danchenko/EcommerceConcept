//
//  MainDataModel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import SwiftUI

struct Answer: Decodable {
    var hotSales: [HotSales]
    var bestSeller: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSeller = "best_seller"
    }
}

struct HotSales: Decodable, Identifiable {
    var id: Int
    var isNew: Bool?
    var title: String
    var subtitle: String
    var pictureUrlString: String
    var isBuy: Bool
    
    var pictureUrl: URL? {
        URL(string: pictureUrlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title
        case subtitle
        case pictureUrlString = "picture"
        case isBuy = "is_buy"
    }
}

struct BestSeller: Decodable, Identifiable {
    var id: Int
    var isFavorites: Bool
    var title: String
    var regularPrice: Int
    var discountPrice: Int
    var pictureUrlString: String
    
    var pictureUrl: URL? {
        URL(string: pictureUrlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case isFavorites = "is_favorites"
        case title
        case regularPrice = "price_without_discount"
        case discountPrice = "discount_price"
        case pictureUrlString = "picture"
    }
}
