//
//  DetailProductView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct DetailProductView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    @State var currentIndex: Int = 0
    
    @State var images: [Image] = []
    
    var body: some View {
        VStack() {
            
            // MARK: - Navigation Bar
            
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
            
            // MARK: - Snap Carousel
            
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
            
            // MARK: - Product Details
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

extension Image: Identifiable {
    public var id: String {
        UUID().uuidString
    }
}
