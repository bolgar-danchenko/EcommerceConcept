//
//  BasketDataModel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import Foundation

struct Basket: Codable, Identifiable {
    var id: String
    var delivery: String
    var total: Int
    var basketProducts: [BasketProduct]
    
    enum CodingKeys: String, CodingKey {
        case id
        case delivery
        case total
        case basketProducts = "basket"
    }
}

struct BasketProduct: Codable, Identifiable {
    var id: Int
    var title: String
    var imageUrlString: String
    var price: Int
    
    var pictureUrl: URL? {
        URL(string: imageUrlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrlString = "images"
        case price
    }
}
