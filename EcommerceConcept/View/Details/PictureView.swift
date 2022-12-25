//
//  PictureView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 25.12.2022.
//

import SwiftUI

struct PictureView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    @State var images: [Image] = []
    
    var body: some View {
        TabView {
            ForEach(sharedData.detailProduct.pictureUrls, id: \.self) {
                pictureUrl in
                AsyncImage(url: pictureUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .frame(maxHeight: 335)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
                } placeholder: { // For case when image is not downloaded
                    ZStack {
                        Color(uiColor: .white)
                            .cornerRadius(20)
                        ProgressView()
                            .tint(.gray)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 20)
                    .frame(maxHeight: 335)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 5)
                }
            }
        }
        .padding(.top, 20)
        .frame(height: 380)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView()
            .environmentObject(SharedDataModel())
    }
}
