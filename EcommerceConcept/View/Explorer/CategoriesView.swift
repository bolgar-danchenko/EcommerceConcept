//
//  CategoriesView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        HStack {
            
            Text("Select Category")
                .font(.custom(boldFont, size: 25))
                .foregroundColor(Color("Purple"))
            
            Spacer()
            
            Button {
                
            } label: {
                Text("view all")
                    .font(.custom(regularFont, size: 15))
                    .foregroundColor(Color("Orange"))
            }

        }
        .padding(.top, 15)
        .padding(.leading, 20)
        .padding(.trailing, 30)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(ProductType.allCases, id: \.self) { type in
                    ProductTypeView(type: type)
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 30)
        }
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View {
        Button {
            withAnimation {
                sharedData.productType = type
            }
        } label: {
            ZStack {
                Circle()
                    .frame(width: 71, height: 71)
                    .foregroundColor(sharedData.productType == type ? Color("Orange") : Color.white)
                    .shadow(color: .black.opacity(sharedData.productType == type ? 0 : 0.05), radius: 5)
                
                Image(type.rawValue)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(sharedData.productType == type ? Color.white : Color("Gray"))
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 32, maxHeight: 31)
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
