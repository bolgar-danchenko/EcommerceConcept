//
//  EcommerceConceptApp.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 19.12.2022.
//

import SwiftUI

@main
struct EcommerceConceptApp: App {
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    var body: some Scene {
        WindowGroup {
            ExplorerView()
                .environmentObject(sharedData)
        }
    }
}
