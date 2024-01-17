//
//  MysticPopoverBubbleView.swift
//  UniversalPopover
//
//  Created by Sports Dad on 1/16/24.
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
                    .colorScheme(.dark))
                .background(MysticPopoverBubbleRight(arrowPosition: arrowPosition)
                    .stroke()
                    .foregroundStyle(Color(red: 0.125, green: 0.125, blue: 0.125)))
            case .right:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                    }
                }
                .background(MysticPopoverBubbleLeft(arrowPosition: arrowPosition)
                    .foregroundStyle(.regularMaterial)
                    .colorScheme(.dark))
                .background(MysticPopoverBubbleLeft(arrowPosition: arrowPosition)
                    .stroke()
                    .foregroundStyle(Color(red: 0.125, green: 0.125, blue: 0.125)))
            }
        }
    }
}
