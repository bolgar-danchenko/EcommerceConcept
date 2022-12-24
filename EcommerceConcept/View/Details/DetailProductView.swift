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
            VStack() {
                HStack {
                    Text(detailProduct.title)
                        .font(.custom(mediumFont, size: 24))
                        .foregroundColor(Color("Purple"))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("favorites")
                            .resizable()
                            .frame(maxWidth: 14, maxHeight: 13)
                    }
                    .frame(width: 37, height: 33)
                    .background(Color("Purple"))
                    .cornerRadius(10)

                }
                .padding(.top, 30)
                .padding(.horizontal, 30)
                .padding(.bottom, 5)
                
                HStack() {
                    Image(systemName: "star.fill")
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("Gold"))
                    Image(systemName: "star.fill")
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("Gold"))
                    Image(systemName: "star.fill")
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("Gold"))
                    Image(systemName: "star.fill")
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("Gold"))
                    Image(systemName: "star.fill")
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color("Gold"))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                HStack {
                    Text("Shop")
                        .font(.custom(boldFont, size: 20))
                        .foregroundColor(Color("Purple"))
                        .overlay(
                            ZStack {
                                Capsule()
                                    .fill(Color("Orange"))
                                    .frame(height: 3)
                                    .position(x: 40, y: 32)
                            }
                                
                                .padding(.horizontal, -15)
                            , alignment: .bottom
                        )
                    
                    Spacer()
                    
                    Text("Details")
                        .font(.custom(regularFont, size: 20))
                        .foregroundColor(.black.opacity(0.5))
                    
                    Spacer()
                    
                    Text("Features")
                        .font(.custom(regularFont, size: 20))
                        .foregroundColor(.black.opacity(0.5))
                }
                .padding(.top, 30)
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                HStack(alignment: .bottom) {
                    VStack() {
                        Image("cpu")
                            .resizable()
                            .frame(width: 28, height: 28)
                        
                        Text(detailProduct.cpu)
                            .font(.custom(regularFont, size: 11))
                            .foregroundColor(Color("Gray"))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("camera")
                            .resizable()
                            .frame(width: 28, height: 22)
                        
                        Text(detailProduct.camera)
                            .font(.custom(regularFont, size: 11))
                            .foregroundColor(Color("Gray"))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("memory")
                            .resizable()
                            .frame(width: 28, height: 21)
                        
                        Text(detailProduct.ssd)
                            .font(.custom(regularFont, size: 11))
                            .foregroundColor(Color("Gray"))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image("ssd")
                            .resizable()
                            .frame(width: 19, height: 22)
                        
                        Text(detailProduct.sd)
                            .font(.custom(regularFont, size: 11))
                            .foregroundColor(Color("Gray"))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                
                HStack {
                    Text("Select color and capacity")
                        .font(.custom(mediumFont, size: 16))
                        .foregroundColor(Color("Purple"))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
                HStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(uiColor: UIColor(hex: detailProduct.colorHexCodes[0]) ?? .black))
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "checkmark")
                            .frame(width: 17, height: 12.5)
                            .foregroundColor(.white)
                    }
                    
                    ZStack {
                        Circle()
                            .foregroundColor(Color(uiColor: UIColor(hex: detailProduct.colorHexCodes[1]) ?? .black))
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "checkmark")
                            .frame(width: 17, height: 12.5)
                            .foregroundColor(.white).opacity(0)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("Orange"))
                            .frame(width: 70, height: 30)
                            .cornerRadius(10)
                        
                        Text("128 GB")
                            .font(.custom(boldFont, size: 13))
                            .foregroundColor(.white)
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("Orange").opacity(0))
                            .frame(width: 70, height: 30)
                            .cornerRadius(10)
                        
                        Text("256 GB")
                            .font(.custom(boldFont, size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Add to Cart")
                            .font(.custom(boldFont, size: 20))
                            .foregroundColor(.white)
                        .padding([.top, .bottom])
                        
                        Spacer()
                        
                        Text("$\(detailProduct.price)")
                            .font(.custom(boldFont, size: 20))
                            .foregroundColor(.white)
                        .padding([.top, .bottom])
                    }
                    .padding(.horizontal, 30)
                }
                .frame(maxWidth: .infinity)
                .background(Color("Orange"))
                .cornerRadius(10)
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(.white)
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 30))
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 4)
            )
            .padding(.top, 10)
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
