//
//  BestSellersView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct BestSellersView: View {
    var body: some View {
        
        VStack {
            HStack {
                
                Text("Best Sellers")
                    .font(.custom(boldFont, size: 25))
                    .foregroundColor(Color("Purple"))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("see more")
                        .font(.custom(regularFont, size: 15))
                        .foregroundColor(Color("Orange"))
                }
            }
            .padding(.top, -15)
            .padding(.leading, 20)
            .padding(.trailing, 30)
            
            ProductsGridView()
                .padding(.bottom, 15)
        }
        .padding(.top, 5)
    }
}

struct BestSellersView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellersView()
    }
}
