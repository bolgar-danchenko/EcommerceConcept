//
//  Explorer.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct ExplorerView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            NavigationBarView()
            
            ScrollView {
                VStack {
                
                    CategoriesView()
                    
                    SearchBarView()
                    
                    HotSalesView()
                    
                    BestSellersView()
                }
            }
            .background(Color("Background"))
            
            TabBarView()
        }
        .overlay(
            showOverlay()
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    // MARK: - Overlays
    @ViewBuilder
    func showOverlay() -> some View {
        ZStack {
            if sharedData.showDetailProduct {
                DetailProductView()
                    .environmentObject(sharedData)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
            } else if sharedData.showCard {
                CartView()
                    .environmentObject(sharedData)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
            } else if sharedData.showFilter {
                FilterView()
                    .environmentObject(sharedData)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
            }
        }
    }
}

// MARK: - Preview

struct ExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
            .environmentObject(SharedDataModel())
    }
}
