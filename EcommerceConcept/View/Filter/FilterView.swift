//
//  FilterView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 23.12.2022.
//

import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        VStack {
            VStack {
                
                //MARK: - Title Bar
                HStack {
                    Button {
                        withAnimation {
                            sharedData.showFilter = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .frame(width: 11, height: 10)
                    }
                    .frame(width: 37, height: 37)
                    .background(Color("Purple"))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    Text("Filter Options")
                        .font(.custom(mediumFont, size: 18))
                        .foregroundColor(Color("Purple"))
                        .padding(.trailing, 25)
                    
                    Button {
                        withAnimation {
                            sharedData.showFilter = false
                        }
                    } label: {
                        Text("Done")
                            .font(.custom(mediumFont, size: 18))
                            .foregroundColor(.white)
                    }
                    .frame(width: 86, height: 37)
                    .background(Color("Orange"))
                    .cornerRadius(10)
                }
                .padding(.leading, 30)
                .padding(.trailing, 20)
                .padding(.bottom, 20)
                
                //MARK: - Dropdown Selectors
                
                DropdownSelector(filter: sharedData.brandFilter)
                    .padding(.horizontal)
                
                DropdownSelector(filter: sharedData.priceFilter)
                    .padding(.horizontal)
                
                DropdownSelector(filter: sharedData.sizeFilter)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            .background(
                Color(.white)
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 30))
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 4)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .environmentObject(SharedDataModel())
    }
}
