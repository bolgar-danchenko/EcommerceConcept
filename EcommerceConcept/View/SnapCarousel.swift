//
//  SnapCarousel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 21.12.2022.
//

import SwiftUI

// To for Accepting List
struct SnapCarousel<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content
    var list: [T]
    
    // Properties
    var spacing: CGFloat
    var tralingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15,
         trailingSpace: CGFloat = 100,
         index: Binding<Int>,
         items: [T],
         @ViewBuilder content: @escaping (T) -> Content) {
        
        self.list = items
        self.spacing = spacing
        self.tralingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    // Offset
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            
            // Setting correct width for snap carousel
            // One sided snap carousel
            let width = proxy.size.width - (tralingSpace - spacing)
            let adjustmentWidth = (tralingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - tralingSpace)
                }
            }
            // Spacing will be horizontal padding
            .padding(.horizontal, spacing)
            // Setting only after 0th index
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        
                        // Updating current index
                        let offsetX = value.translation.width
                        
                        // were going to convert the translation into progress (0 - 1)
                        // and round the value
                        // based on the progress increasing or decreasing the currentIndex
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        // setting min
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        // updating index
                        currentIndex = index
                    })
                    .onChanged({ value in
                        // updating only index
                        // Updating current index
                        let offsetX = value.translation.width
                        
                        // were going to convert the translation into progress (0 - 1)
                        // and round the value
                        // based on the progress increasing or decreasing the currentIndex
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        // setting min
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        // Animating when offset = 0
        .animation(.easeInOut, value: offset == 0)
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView()
    }
}
