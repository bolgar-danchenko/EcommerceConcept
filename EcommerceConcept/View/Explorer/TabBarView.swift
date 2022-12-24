//
//  TabBarView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        HStack(spacing: 40) {
            
            Button {
                
            } label: {
                Image("explorer")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .foregroundColor(.white)
            }
            
            Button {
                withAnimation(.default) {
                    sharedData.showCard = true
                }
            } label: {
                ZStack(alignment: .topTrailing) {
                    Image("cart")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                    .foregroundColor(.white)
                    
                    ZStack {
                        Circle()
                            .frame(width: 15, height: 15)
                        .foregroundColor(.red)
                        
                        Text("\(basket.basketProducts.count)")
                            .font(.custom(mediumFont, size: 10))
                            .foregroundColor(.white)
                    }
                    .padding(.top, -5)
                    .padding(.trailing, -5)
                }
            }
            
            Button {
                // some action
            } label: {
                Image("favorites")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .foregroundColor(.white)
            }
            
            Button {
                // some action
            } label: {
                Image("profile")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 30)
        .frame(height: 90)
        .frame(maxWidth: .infinity)
        .background(Color("Purple"))
        .cornerRadius(30)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
