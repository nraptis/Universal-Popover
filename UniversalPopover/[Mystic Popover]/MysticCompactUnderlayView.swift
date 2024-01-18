//
//  MysticCompactUnderlayView.swift
//  UniversalPopover
//
//  Created by Sports Dad on 1/17/24.
//

import SwiftUI

struct MysticCompactUnderlayView: View {
    
    struct RoundedCorner: Shape {

        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .topLeft.union(.topRight)

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
        }
        
        .background(RoundedCorner(radius: MysticPopoverBubbleConstants.cornerRadius)
            .foregroundStyle(.regularMaterial)
            .colorScheme(.dark))
        .background(RoundedCorner(radius: MysticPopoverBubbleConstants.cornerRadius)
            .stroke()
            .foregroundStyle(Color(red: 0.125, green: 0.125, blue: 0.125)))
        .ignoresSafeArea(.all)
    }
}
