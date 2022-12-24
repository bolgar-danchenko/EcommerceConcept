//
//  DetailProductView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct DetailProductView: View {
    
    @State var currentIndex: Int = 0
    @State var images: [Image] = []
    
    var body: some View {
        VStack() {
            
            ProductNavigationView()
            
            PicturesSnapCarousel(spacing: 20, index: $currentIndex, items: images) { image in
                
                GeometryReader { proxy in
                    
                    let size = proxy.size
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear {
                
                DispatchQueue.main.async {
                    for imageUrl in detailProduct.pictureUrls {
                        guard let safeUrl = imageUrl else { return }
                        DownloadManager().downloadImage(imageUrl: safeUrl) { image in
                            guard let newImage = image else { return }
                            self.images.append(newImage)
                        }
                    }
                }
            }
            .padding(.top, 10)
            
            ProductDetails()
        }
        .ignoresSafeArea()
        .padding(.top, 5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView()
    }
}


