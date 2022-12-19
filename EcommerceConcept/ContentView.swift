//
//  ContentView.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Hello, world!")
                .font(.custom(regularFont, size: 50))
            Text("Hello, world!")
                .font(.custom(mediumFont, size: 50))
            Text("Hello, world!")
                .font(.custom(boldFont, size: 50))
            Text("Hello, world!")
                .font(.custom(heavyFont, size: 50))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
