//
//  Filters.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import Foundation

struct Filter: Hashable {
    var name: String
    var options: [DropdownOption]
    
    var placeholder: String = "Choose..."
}

struct DropdownOption: Hashable {
    var key: String = UUID().uuidString
    let value: String
    
//    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
//        return lhs.key == rhs.key
//    }
}
