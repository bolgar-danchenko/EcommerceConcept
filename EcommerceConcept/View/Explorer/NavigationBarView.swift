//
//  NavigationBar.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct NavigationBarView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
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
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
