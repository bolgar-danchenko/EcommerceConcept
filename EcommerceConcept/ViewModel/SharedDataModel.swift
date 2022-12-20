//
//  SharedDataModel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    // Detail product data
    @Published var detailProduct: DetailProduct?
    @Published var showDetailProduct: Bool = false
    
    // Favorite products
    @Published var favoriteProducts: [BestSellerProduct] = []
    
    // Basket
//    @Published let basket: Basket = DownloadManager().getBasket()
}
