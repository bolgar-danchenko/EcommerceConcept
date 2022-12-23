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
        TabView {
            ForEach(hotSalesProducts) {
                product in
                HotSalesView(product: product)
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        withAnimation {
                            sharedData.showDetailProduct = true
                        }
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct HotSalesTabView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesTabView()
    }
}
