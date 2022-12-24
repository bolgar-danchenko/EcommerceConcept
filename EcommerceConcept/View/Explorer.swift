//
//  Explorer.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct Explorer: View {
    
    @StateObject var explorerData: ExplorerViewModel = ExplorerViewModel()
    @EnvironmentObject var sharedData: SharedDataModel
    @State private var searchText: String = ""
    @State private var hotImages: [Image] = []
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // MARK: - Title Bar
            HStack {
                
                Spacer()
                
                Image("pin")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 12, height: 15)
                    .foregroundColor(Color("Orange"))
                
                Text("Zihuatanejo, Gro")
                    .font(.custom(mediumFont, size: 15))
                    .foregroundColor(Color("Purple"))
                
                Image(systemName: "chevron.down")
                    .foregroundColor(Color("Gray"))
                
                Spacer()
                
                Button {
                    withAnimation {
                        sharedData.showFilter = true
                    }
                } label: {
                    Image("filter")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 11, height: 13)
                        .foregroundColor(Color("Purple"))
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 10)
            .background(Color("Background"))
            
            ScrollView {
                VStack {
                    
                    // MARK: - Categories
                    HStack {
                        
                        Text("Select Category")
                            .font(.custom(boldFont, size: 25))
                            .foregroundColor(Color("Purple"))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("view all")
                                .font(.custom(regularFont, size: 15))
                                .foregroundColor(Color("Orange"))
                        }

                    }
                    .padding(.top, 15)
                    .padding(.leading, 20)
                    .padding(.trailing, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(ProductType.allCases, id: \.self) { type in
                                ProductTypeView(type: type)
                            }
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 30)
                    }
                    
                    // MARK: - Search Bar
                    HStack(spacing: 15) {
                        SearchBarView()
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(Color("Orange"))
                                
                                Image("qrcode")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                            }
                        }

                    }
                    .padding(.horizontal, 40)
                    
                    // MARK: - Hot Sales
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
                    
                    HotSalesTabView()
                        .padding(.top, -30)
                        .frame(height: 190)
                    
                    // MARK: - Best Sellers
                    HStack {
                        
                        Text("Best Sellers")
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
                    .padding(.top, -15)
                    .padding(.leading, 20)
                    .padding(.trailing, 30)
                    
                    ProductsGridView()
                        .padding(.bottom, 10)
                }
            }
            .background(Color("Background"))
            
            // MARK: - Tab Bar
            HStack(spacing: 40) {
                
                Button {
                    
                } label: {
                    Image("explorer")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(.white)
                }
                
                Button {
                    withAnimation(.default) {
                        sharedData.showCard = true
                    }
                } label: {
                    ZStack(alignment: .topTrailing) {
                        Image("cart")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                        .foregroundColor(.white)
                        
                        ZStack {
                            Circle()
                                .frame(width: 15, height: 15)
                            .foregroundColor(.red)
                            
                            Text("\(basket.basketProducts.count)")
                                .font(.custom(mediumFont, size: 10))
                                .foregroundColor(.white)
                        }
                        .padding(.top, -5)
                        .padding(.trailing, -5)
                        
                    }
                    
                }
                
                Button {
                    // some action
                } label: {
                    Image("favorites")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(.white)
                }
                
                Button {
                    // some action
                } label: {
                    Image("profile")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 30)
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            .background(Color("Purple"))
            .cornerRadius(30)
        }
        // MARK: - Overlays
        .overlay(
            ZStack {
                if sharedData.showDetailProduct {
                    DetailProductView()
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                } else if sharedData.showCard {
                    Cart()
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                } else if sharedData.showFilter {
                    FilterView()
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    // MARK: - ProductTypeView
    
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View {
        Button {
            withAnimation {
                explorerData.productType = type
            }
        } label: {
            ZStack {
                Circle()
                    .frame(width: 71, height: 71)
                    .foregroundColor(explorerData.productType == type ? Color("Orange") : Color.white)
                    .shadow(color: .black.opacity(explorerData.productType == type ? 0 : 0.05), radius: 5)
                
                Image(type.rawValue)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(explorerData.productType == type ? Color.white : Color("Gray"))
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 32, maxHeight: 31)
            }
        }
    }
    
    // SearchBarView
    
    @ViewBuilder
    func SearchBarView() -> some View {
        HStack(spacing: 15) {
            Image("magnifier")
                .resizable()
                .frame(width: 16, height: 16)
            
            TextField("", text: $searchText)
                .font(.custom(regularFont, size: 14))
                .foregroundColor(Color("Purple"))
                .placeholder(when: searchText.isEmpty) {
                    Text("Search")
                        .font(.custom(regularFont, size: 12))
                        .foregroundColor(Color("Purple").opacity(0.5))
                }
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(50)
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}

// MARK: - Preview

struct Explorer_Previews: PreviewProvider {
    static var previews: some View {
        Explorer()
            .environmentObject(SharedDataModel())
    }
}
