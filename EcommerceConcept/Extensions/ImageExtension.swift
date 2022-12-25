//
//  ImageExtension.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 25.12.2022.
//

import SwiftUI

// Used to get Image from downloaded data
extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else { return nil }
        self = .init(uiImage: image)
    }
}
