//
//  TabBar.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

// All tabs
enum Tab: String, CaseIterable {
    case explorer = "explorer"
    case cart = "cart"
    case favorites = "favorites"
    case profile = "profile"
}

struct TabBar: View {
    
    // Current tab
    @State var currentTab: Tab = .explorer
    
    @Namespace var animation
    
    // Hiding tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        // Tab view
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                
                Explorer()
                    .tag(Tab.explorer)
                
                Cart()
                    .tag(Tab.cart)
                
                Favorites()
                    .tag(Tab.favorites)
                
                Profile()
                    .tag(Tab.profile)
            }
            
            // Custom tab bar
            HStack(spacing: 40) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        // Updating tab
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 30)
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            .background(Color("Purple"))
            .cornerRadius(30)
        }
        .ignoresSafeArea()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
