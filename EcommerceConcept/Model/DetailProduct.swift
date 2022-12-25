//
//  DetailesDataModel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import Foundation

struct DetailProduct: Codable, Identifiable {
    var id: String
    var title: String
    var cpu: String
    var camera: String
    var capacity: [String]
    var colorHexCodes: [String]
    var imageUrlsStrings: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Float
    var sd: String
    var ssd: String
    
    var pictureUrls: [URL?] {
        var array: [URL?] = []
        for pictureUrlString in imageUrlsStrings {
            array.append(URL(string: pictureUrlString))
        }
        return array
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case cpu = "CPU"
        case camera
        case capacity
        case colorHexCodes = "color"
        case imageUrlsStrings = "images"
        case isFavorites
        case price
        case rating
        case sd
        case ssd
    }
}
