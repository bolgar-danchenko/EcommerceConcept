//
//  Explorer.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

struct Explorer: View {
    
    @StateObject var explorerData: ExplorerViewModel = ExplorerViewModel()
    
    @State private var searchText: String = ""
    
    @State private var hotImages: [Image] = []
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                // Title bar
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
                    
                    Image("filter")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 11, height: 13)
                        .foregroundColor(Color("Purple"))
                }
                .padding(.horizontal, 30)
                
                // Categories
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
                
                // Search bar
                HStack(spacing: 15) {
                    SearchBar()
                    
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
                
                // Hot sales
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
                
                // Best sellers
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
    }
    
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
    
    @ViewBuilder
    func SearchBar() -> some View {
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

struct Explorer_Previews: PreviewProvider {
    static var previews: some View {
        Explorer()
    }
}

enum ProductType: String, CaseIterable {
    case phones = "Phones"
    case computer = "Computer"
    case health = "Health"
    case books = "Books"
    case other = "Other"
}

extension View {
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
