//
//  DropdownSelector.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 24.12.2022.
//

import SwiftUI

struct DropdownSelector: View {
    
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    
    var filter: Filter
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    
    private let buttonHeight: CGFloat = 45
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(filter.name)
                .font(.custom(mediumFont, size: 18))
                .foregroundColor(Color("Purple"))
            
            Button {
                self.shouldShowDropdown.toggle()
            } label: {
                HStack {
                    Text(selectedOption == nil ? filter.placeholder : selectedOption!.value)
                        .font(.custom(regularFont, size: 18))
                        .foregroundColor(selectedOption == nil ? Color.gray : Color("Purple"))
                    
                    Spacer()
                    
                    Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 16, height: 8)
                        .foregroundColor(Color.gray)
                }
                .padding(20)
                .frame(height: 37)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.lightGray), style: StrokeStyle(lineWidth: 0.5)))
            }
            .cornerRadius(5)
            .frame(height: self.buttonHeight)
            .overlay(
                VStack {
                    if self.shouldShowDropdown {
                        Spacer(minLength: buttonHeight + 10)
                        Dropdown(options: self.filter.options) { option in
                            shouldShowDropdown = false
                            selectedOption = option
                            self.onOptionSelected?(option)
                        }
                        .padding(.horizontal)
                    }
                }
                    .position(x: 160, y: -95)
                , alignment: .topLeading
            )
            .background(
                RoundedRectangle(cornerRadius: 5).fill(Color.white)
            )
        }
        .padding(.horizontal)
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    
    static var previews: some View {
        DropdownSelector(filter: brandFilter)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30)
        .padding()
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.lightGray), lineWidth: 0.5)
        )
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    
    var body: some View {
        Button {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        } label: {
            HStack {
                Text(self.option.value)
                    .font(.custom(regularFont, size: 16))
                    .foregroundColor(Color("Purple"))
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
