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
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: -5) {
                
                ProductNavigationView()
                
                PictureView()
                
                ProductDetails()
            }
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
            .environmentObject(SharedDataModel())
    }
}


