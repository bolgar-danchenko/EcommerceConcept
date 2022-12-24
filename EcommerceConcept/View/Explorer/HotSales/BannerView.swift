//
//  HotSalesView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 23.12.2022.
//

import SwiftUI

struct BannerView: View {
    
    @State var product: HotSalesProduct
    
    var body: some View {
        ZStack(alignment: .center) {
            
            AsyncImage(url: product.pictureUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 182)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            } placeholder: { // For case when image is not downloaded
                ZStack {
                    Color(uiColor: .black)
                        .frame(height: 182)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                    ProgressView()
                        .tint(.white)
                }
            }
            
            VStack(alignment: .leading) {
                
                // New label appears only if .isNew == true
                ZStack {
                    Circle()
                        .frame(width: 27, height: 27)
                        .foregroundColor(Color("Orange"))
                    
                    Text("New")
                        .font(.custom(boldFont, size: 10))
                        .foregroundColor(.white)
                }.opacity(product.isNew ?? false ? 1 : 0)
                
                Text(product.title)
                    .font(.custom(boldFont, size: 25))
                    .foregroundColor(.white)
                
                Text(product.subtitle)
                    .font(.custom(regularFont, size: 11))
                    .foregroundColor(.white)
                
                Button {
                    
                } label: {
                    Text("Buy now!")
                        .font(.custom(boldFont, size: 11))
                        .foregroundColor(Color("Purple"))
                }
                .frame(width: 98, height: 23)
                .background(Color.white)
                .cornerRadius(5)
                .padding(.top, 15)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
        }
    }
}

//struct BannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerView(product: hotSalesProducts[0])
//            .padding()
//            .background(Color("Background"))
//    }
//}
