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
    
    @Namespace var animation
    
    var body: some View {
        VStack() {
            HStack {
                Button {
                    withAnimation {
                        
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
                        .frame(width: 14, height: 18)
                }
                .frame(width: 37, height: 37)
                .background(Color("Orange"))
                .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            
            VStack(spacing: 15) {
                
                // Snap carousel
                SnapCarousel(spacing: 25, index: $currentIndex, items: images) { image in
                    
                    GeometryReader { proxy in
                        
                        let size = proxy.size
                        
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width)
                            .cornerRadius(12)
                    }
                }
                .padding(.vertical, 40)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear {
                for imageUrl in detailProduct.pictureUrls {
                    guard let safeUrl = imageUrl else { return }
                    DownloadManager().downloadImage(imageUrl: safeUrl) { image in
                        guard let newImage = image else { return }
                        self.images.append(newImage)
                    }
                }
            }
            .padding(.bottom, 40)
            
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
            
        }
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
