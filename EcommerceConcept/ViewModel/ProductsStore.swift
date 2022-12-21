//
//  ProductsStore.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

let mainProducts: AllProducts = Bundle.main.decode("products.json")
let hotSalesProducts = mainProducts.hotSalesArray
let bestSellerProducts = mainProducts.bestSellerArray
let detailProduct: DetailProduct = Bundle.main.decode("details.json")
let basket: Basket = Bundle.main.decode("basket.json")
