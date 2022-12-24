//
//  ProductsStore.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

// MARK: - Products Store

let mainProducts: AllProducts = Bundle.main.decode("products.json")
let hotSalesProducts = mainProducts.hotSalesArray
let bestSellerProducts = mainProducts.bestSellerArray
let detailProduct: DetailProduct = Bundle.main.decode("details.json")
let basket: Basket = Bundle.main.decode("basket.json")

// MARK: - Filters

let brandFilter = Filter(name: "Brand", options: brandFilterOptions)
let priceFilter = Filter(name: "Price", options: priceFilterOptions)
let sizeFilter = Filter(name: "Size", options: sizeFilterOptions)

let brandFilterOptions: [DropdownOption] = [
    DropdownOption(value: "Apple"),
    DropdownOption(value: "Samsung"),
    DropdownOption(value: "Xiaomi"),
]

let priceFilterOptions: [DropdownOption] = [
    DropdownOption(value: "$0 - $499"),
    DropdownOption(value: "$500 - $999"),
    DropdownOption(value: "$1000 - $2499"),
    DropdownOption(value: "$2500 - $4999"),
    DropdownOption(value: "$5000 - $10000"),
]

let sizeFilterOptions: [DropdownOption] = [
    DropdownOption(value: "4.0 to 5.5 inches"),
    DropdownOption(value: "5.6 to 6.3 inches"),
    DropdownOption(value: "6.4 to 6.8 inches"),
]
