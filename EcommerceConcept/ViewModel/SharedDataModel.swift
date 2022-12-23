//
//  SharedDataModel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 20.12.2022.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    @Published var showDetailProduct: Bool = false
    @Published var showCard: Bool = false
}
