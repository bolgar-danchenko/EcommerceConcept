//
//  ProductsGridView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 23.12.2022.
//

import SwiftUI

let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

struct ProductsGridView: View {
    var body: some View {
        
        LazyVGrid(columns: gridLayout, spacing: 30) {
            ForEach(bestSellerProducts) {
                product in
                ProductItemView(product: product)
                    .onTapGesture {
                        withAnimation {
                            
                        }
                    }
            }
        }
    }
}

struct ProductsGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGridView()
    }
}
