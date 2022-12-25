//
//  ProductNavigationView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct ProductNavigationView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    sharedData.showDetailProduct = false
                }
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
                    .frame(width: 7, height: 14)
            }
            .frame(width: 37, height: 37)
            .background(Color("Purple"))
            .cornerRadius(10)
            
            Spacer()
            
            Text("Product Details")
                .font(.custom(mediumFont, size: 18))
            
            Spacer()
            
            Button {
                withAnimation {
                    sharedData.showDetailProduct = false
                    sharedData.showCart = true
                }
            } label: {
                Image("cart")
                    .resizable()
                    .frame(maxWidth: 14, maxHeight: 14)
            }
            .frame(width: 37, height: 37)
            .background(Color("Orange"))
            .cornerRadius(10)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 10)
    }
}

struct ProductNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNavigationView()
            .environmentObject(SharedDataModel())
    }
}
