//
//  ProductItemView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 23.12.2022.
//

import SwiftUI

struct ProductItemView: View {
    
    @State var product: BestSellerProduct
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(10)
            
            VStack {
                AsyncImage(url: product.pictureUrl) { image in
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 182)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                } placeholder: {
                    ZStack {
                        Color(uiColor: .white)
                            .cornerRadius(10)
                        ProgressView()
                    }
                        
                }
                
                HStack() {
                    Text("$\(product.discountPrice)")
                        .font(.custom(boldFont, size: 16))
                        .foregroundColor(Color("Purple"))
                    
                    Text("$\(product.regularPrice)")
                        .strikethrough(true)
                        .font(.custom(mediumFont, size: 10))
                        .foregroundColor(Color("Gray"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                
                Text(product.title)
                    .font(.custom(regularFont, size: 10))
                    .foregroundColor(Color("Purple"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
            }
            
            Button {
                
            } label: {
                // Image depending on .isFavorites
                Image(product.isFavorites ? "heart.filled" : "heart.notfilled")
                    .resizable()
                    .frame(width: 11, height: 10)
            }
            .frame(width: 25, height: 25)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.15), radius: 5)
            .padding(.top, 10)
            .padding(.trailing, 10)

        }
        .frame(width: 181, height: 227)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: bestSellerProducts[2])
    }
}
