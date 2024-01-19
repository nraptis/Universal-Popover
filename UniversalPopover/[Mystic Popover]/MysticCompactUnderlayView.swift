//
//  Orientation.swift
//  Invisible Cyclopse
//
//  Created by Dr. Handsome on 11/8/23.
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
            .colorScheme(.dark)
            .shadow(color: .black.opacity(0.36), radius: 16.0, x: 0.0, y: 0.0))
        .background(RoundedCorner(radius: MysticPopoverBubbleConstants.cornerRadius)
            .stroke(lineWidth: 2.0)
            .foregroundStyle(Color(red: 0.42, green: 0.42, blue: 0.42)))
        .ignoresSafeArea(.all)
    }
}
