//
//  SearchBarView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
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
    }
    
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

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
