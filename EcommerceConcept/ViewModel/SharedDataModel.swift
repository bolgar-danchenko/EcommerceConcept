//
//  SharedDataModel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    @Published var showDetailProduct: Bool = false
    @Published var showCart: Bool = false
    @Published var showFilter: Bool = false
    
    @Published var productType: ProductType = .phones
    
    // MARK: - Products Store

    lazy var mainProducts: AllProducts = Bundle.main.decode("products.json")
    lazy var hotSalesProducts = mainProducts.hotSalesArray
    lazy var bestSellerProducts = mainProducts.bestSellerArray
    lazy var detailProduct: DetailProduct = Bundle.main.decode("details.json")
    lazy var basket: Basket = Bundle.main.decode("basket.json")

    // MARK: - Filters

    lazy var brandFilter = Filter(name: "Brand", options: brandFilterOptions)
    lazy var priceFilter = Filter(name: "Price", options: priceFilterOptions)
    lazy var sizeFilter = Filter(name: "Size", options: sizeFilterOptions)

    lazy var brandFilterOptions: [DropdownOption] = [
        DropdownOption(value: "Apple"),
        DropdownOption(value: "Samsung"),
        DropdownOption(value: "Xiaomi"),
    ]

    lazy var priceFilterOptions: [DropdownOption] = [
        DropdownOption(value: "$0 - $499"),
        DropdownOption(value: "$500 - $999"),
        DropdownOption(value: "$1000 - $2499"),
        DropdownOption(value: "$2500 - $4999"),
        DropdownOption(value: "$5000 - $10000"),
    ]

    lazy var sizeFilterOptions: [DropdownOption] = [
        DropdownOption(value: "4.0 to 5.5 inches"),
        DropdownOption(value: "5.6 to 6.3 inches"),
        DropdownOption(value: "6.4 to 6.8 inches"),
    ]

}
