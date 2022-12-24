//
//  SnapCarousel.swift
//  EcommerceConcept
//
//  Created by Konstantin Bolgar-Danchenko on 21.12.2022.
//

import SwiftUI

struct PicturesSnapCarousel<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content
    var list: [T]
    
    // Properties
    var spacing: CGFloat
    var tralingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15,
         trailingSpace: CGFloat = 150,
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
            
            let width = proxy.size.width - (tralingSpace - spacing)
            let adjustmentWidth = (tralingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - tralingSpace)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
}
