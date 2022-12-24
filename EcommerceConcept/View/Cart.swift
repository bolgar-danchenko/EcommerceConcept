//
//  Cart.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct Cart: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        sharedData.showCard = false
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
                
                Text("Add address")
                    .font(.custom(mediumFont, size: 15))
                
                Button {
                    
                } label: {
                    Image("pin")
                        .resizable()
                        .frame(width: 14, height: 18)
                }
                .frame(width: 37, height: 37)
                .background(Color("Orange"))
                .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            
            
            Text("My Cart")
                .font(.custom(boldFont, size: 35))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 30)
            
            VStack() {
                
                Spacer()
                
                ForEach(basket.basketProducts) { product in
                    CartView(product: product)
                }
                .frame(height: 115)
                
                Spacer()
                
                Divider()
                    .frame(height: 2)
                    .background(.white.opacity(0.25))
                    .padding(.top, 50)
                
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Total")
                            .font(.custom(regularFont, size: 15))
                            .foregroundColor(.white)
                        
                        Text("Delivery")
                            .font(.custom(regularFont, size: 15))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("$\(basket.total)")
                            .font(.custom(boldFont, size: 15))
                            .foregroundColor(.white)
                        
                        Text(basket.delivery)
                            .font(.custom(boldFont, size: 15))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .padding(.horizontal)
                
                Divider()
                    .frame(height: 1)
                    .background(.white.opacity(0.2))
                    .padding(.bottom)
                
                Button {
                    
                } label: {
                    Text("Checkout")
                        .font(.custom(boldFont, size: 20))
                        .foregroundColor(.white)
                        .padding([.top, .bottom])
                }
                .frame(maxWidth: .infinity)
                .background(Color("Orange"))
                .cornerRadius(10)
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("Purple")
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 30))
                    .ignoresSafeArea()
            )
            .padding(.top, 10)
            
        }
        .ignoresSafeArea()
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
            .environmentObject(SharedDataModel())
    }
}
