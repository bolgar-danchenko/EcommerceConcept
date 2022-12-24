//
//  CartNavigationView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct CartNavigationView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
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
    }
}

struct CartNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CartNavigationView()
    }
}
