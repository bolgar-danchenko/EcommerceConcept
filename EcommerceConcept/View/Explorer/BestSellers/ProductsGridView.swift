//
//  ProductsGridView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 23.12.2022.
//

import SwiftUI

struct ProductsGridView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    let rowSpacing: CGFloat = 10
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
    }
    
    var body: some View {
        
        LazyVGrid(columns: gridLayout, spacing: 30) {
            ForEach(bestSellerProducts) {
                product in
                ProductItemView(product: product)
                    .onTapGesture {
                        withAnimation {
                            sharedData.showDetailProduct = true
                        }
                    }
            }
        }
    }
}

struct ProductsGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGridView()
            .environmentObject(SharedDataModel())
    }
}
