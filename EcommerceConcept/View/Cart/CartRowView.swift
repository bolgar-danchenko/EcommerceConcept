//
//  CartView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct CartRowView: View {
    
    // Making product as binding to update in real time
    var product: BasketProduct
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            AsyncImage(url: product.pictureUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 88, height: 88)
                    .cornerRadius(10)
            } placeholder: {
                ZStack {
                    Color(uiColor: .white)
                        .frame(width: 88, height: 88)
                        .cornerRadius(10)
                    ProgressView()
                }
            }
            
            VStack(spacing: 5) {
                Text(product.title)
                    .font(.custom(mediumFont, size: 20))
                    .lineLimit(2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("$\(product.price)")
                    .font(.custom(mediumFont, size: 20))
                    .foregroundColor(Color("Orange"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Button {
                    
                } label: {
                    Text("-")
                        .font(.custom(mediumFont, size: 20))
                        .foregroundColor(.white)
                }
                
                Text("1")
                    .font(.custom(mediumFont, size: 20))
                    .foregroundColor(.white)
                
                Button {
                    
                } label: {
                    Text("+")
                        .font(.custom(mediumFont, size: 20))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 30, height: 80)
            .background(Color("DarkGray"))
            .cornerRadius(26)
            
            Image("trash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 16)
                
        }
        .padding()
        .background(Color("Purple"))
    }
}

struct CartRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartRowView(product: basket.basketProducts[1])
    }
}
