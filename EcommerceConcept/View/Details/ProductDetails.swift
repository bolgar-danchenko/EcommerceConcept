//
//  ProductDetails.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct ProductDetails: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        VStack() {
            
            // MARK: - General
            HStack {
                Text(sharedData.detailProduct.title)
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
            
            // MARK: - Tabs
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
            
            //MARK: - Pictures
            HStack(alignment: .bottom) {
                VStack() {
                    Image("cpu")
                        .resizable()
                        .frame(width: 28, height: 28)
                    
                    Text(sharedData.detailProduct.cpu)
                        .font(.custom(regularFont, size: 11))
                        .foregroundColor(Color("Gray"))
                }
                
                Spacer()
                
                VStack {
                    Image("camera")
                        .resizable()
                        .frame(width: 28, height: 22)
                    
                    Text(sharedData.detailProduct.camera)
                        .font(.custom(regularFont, size: 11))
                        .foregroundColor(Color("Gray"))
                }
                
                Spacer()
                
                VStack {
                    Image("memory")
                        .resizable()
                        .frame(width: 28, height: 21)
                    
                    Text(sharedData.detailProduct.ssd)
                        .font(.custom(regularFont, size: 11))
                        .foregroundColor(Color("Gray"))
                }
                
                Spacer()
                
                VStack {
                    Image("ssd")
                        .resizable()
                        .frame(width: 19, height: 22)
                    
                    Text(sharedData.detailProduct.sd)
                        .font(.custom(regularFont, size: 11))
                        .foregroundColor(Color("Gray"))
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            
            // MARK: - Color and Capacity
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
                        .foregroundColor(Color(uiColor: UIColor(hex: sharedData.detailProduct.colorHexCodes[0]) ?? .black))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "checkmark")
                        .frame(width: 17, height: 12.5)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Circle()
                        .foregroundColor(Color(uiColor: UIColor(hex: sharedData.detailProduct.colorHexCodes[1]) ?? .black))
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
            
            // MARK: - Button
            Button {
                
            } label: {
                HStack {
                    Text("Add to Cart")
                        .font(.custom(boldFont, size: 20))
                        .foregroundColor(.white)
                    .padding([.top, .bottom])
                    
                    Spacer()
                    
                    Text("$\(sharedData.detailProduct.price)")
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(
            Color(.white)
                .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 30))
                .ignoresSafeArea()
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 4)
        )
        .padding(.top, 10)
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails()
            .environmentObject(SharedDataModel())
    }
}
