//
//  HotSalesTabView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 23.12.2022.
//

import SwiftUI

struct HotSalesTabView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Hot Sales")
                    .font(.custom(boldFont, size: 25))
                    .foregroundColor(Color("Purple"))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("see more")
                        .font(.custom(regularFont, size: 15))
                        .foregroundColor(Color("Orange"))
                }
            }
            .padding(.top, 15)
            .padding(.leading, 20)
            .padding(.trailing, 30)
            
            TabView {
                ForEach(hotSalesProducts) {
                    product in
                    HotSalesView(product: product)
                        .padding(.all, 15)
                        .onTapGesture {
                            withAnimation {
                                sharedData.showDetailProduct = true
                            }
                        }
                }
            }
            .padding(.top, -30)
            .frame(height: 190)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct HotSalesTabView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesTabView()
    }
}
