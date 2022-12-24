//
//  ImageExtension.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

// Extension allows to use images in generic struct 'PicturesSnapCarousel'
extension Image: Identifiable {
    public var id: String {
        UUID().uuidString
    }
}
