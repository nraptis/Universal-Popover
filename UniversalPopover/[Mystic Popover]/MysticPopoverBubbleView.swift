//
//  Orientation.swift
//  Invisible Cyclopse
//
//  Created by Dr. Handsome on 11/8/23.
//

import SwiftUI

struct MysticPopoverBubbleView: View {
    
    enum Side {
        case left
        case right
    }
    
    enum ArrowPosition {
        case top
        case middle
        case bottom
    }
    
    let side: Side
    let arrowPosition: ArrowPosition
    
    var body: some View {
        ZStack {
            switch side {
            case .left:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                    }
                }
                .background(MysticPopoverBubbleRight(arrowPosition: arrowPosition)
                    .foregroundStyle(.regularMaterial)
                    .colorScheme(.dark)
                    .shadow(color: .black.opacity(0.36), radius: 16.0, x: 0.0, y: 0.0))
                .background(MysticPopoverBubbleRight(arrowPosition: arrowPosition)
                    .stroke(lineWidth: 2.0)
                    .foregroundStyle(Color(red: 0.42, green: 0.42, blue: 0.42)))
            case .right:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                    }
                }
                .background(MysticPopoverBubbleLeft(arrowPosition: arrowPosition)
                    .foregroundStyle(.regularMaterial)
                    .colorScheme(.dark)
                    .shadow(color: .black.opacity(0.36), radius: 16.0, x: 0.0, y: 0.0))
                .background(MysticPopoverBubbleLeft(arrowPosition: arrowPosition)
                    .stroke(lineWidth: 2.0)
                    .foregroundStyle(Color(red: 0.42, green: 0.42, blue: 0.42)))
            }
        }
    }
}
