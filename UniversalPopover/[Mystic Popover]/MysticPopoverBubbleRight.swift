//
//  PopoverBubbleRight.swift
//  PopoverBubbles1000
//
//  Created by Sports Dad on 1/16/24.
//

import SwiftUI

struct MysticPopoverBubbleRight: Shape {
    
    let arrowPosition: MysticPopoverBubbleView.ArrowPosition
    
    func path(in rect: CGRect) -> Path {
        
        let inset = MysticPopoverBubbleConstants.inset
        let handleLength = MysticPopoverBubbleConstants.handleLength
        let cornerRadius = MysticPopoverBubbleConstants.cornerRadius
        let controlPointOffsetBase = MysticPopoverBubbleConstants.controlPointOffsetBase
        let controlPointOffsetTip = MysticPopoverBubbleConstants.controlPointOffsetTip
        let cornerPadding = MysticPopoverBubbleConstants.cornerPadding
        let handleWidthBase = MysticPopoverBubbleConstants.handleWidthBase
        
        let minY = inset +
        cornerRadius +
        controlPointOffsetBase +
        controlPointOffsetBase +
        cornerPadding
        
        let maxY = rect.height -
        inset -
        cornerRadius -
        controlPointOffsetBase -
        controlPointOffsetBase -
        cornerPadding
        
        let y: CGFloat
        switch arrowPosition {
        case .top:
            y = minY
        case .middle:
            y = minY + (maxY - minY) * 0.5
        case .bottom:
            y = maxY
        }
        
        var result = Path()
        
        //top line
        result.move(to: CGPoint(x: inset + cornerRadius, y: inset))
        result.addLine(to: CGPoint(x: rect.maxX - (inset + cornerRadius), y: inset))
        
        //top right
        let pivotTR = CGPoint(x: rect.maxX - (inset + cornerRadius), y: inset + cornerRadius)
        result.addArc(center: pivotTR, radius: cornerRadius, startAngle: Angle.degrees(270.0), endAngle: Angle.degrees(360.0), clockwise: false)
        
        //right line
        
        let handleBottomY = y + handleWidthBase
        let handleTopY = y - handleWidthBase
        
        let handleTipX: CGFloat = (rect.maxX - inset) + handleLength
        
        result.addLine(to: CGPoint(x: rect.maxX - inset, y: handleTopY))
        
        result.addCurve(to: CGPoint(x: handleTipX, y: y),
                        control1: CGPoint(x: rect.maxX - inset, y: handleTopY + controlPointOffsetBase),
                        control2: CGPoint(x: handleTipX, y: y - controlPointOffsetTip))
        
        result.addCurve(to: CGPoint(x: rect.maxX - inset, y: handleBottomY),
                        control1: CGPoint(x: handleTipX, y: y + controlPointOffsetTip),
                        control2: CGPoint(x: rect.maxX - inset, y: handleBottomY - controlPointOffsetBase))
         
        result.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.maxY - (inset + cornerRadius)))
        
        //bottom right
        let pivotBR = CGPoint(x: rect.maxX - (inset + cornerRadius), y: rect.maxY - (inset + cornerRadius))
        result.addArc(center: pivotBR, radius: cornerRadius, startAngle: Angle.degrees(0.0), endAngle: Angle.degrees(90.0), clockwise: false)
        
        //bottom line
        result.addLine(to: CGPoint(x: inset + cornerRadius, y: rect.maxY - inset))
        
        //bottom left
        let pivotBL = CGPoint(x: inset + cornerRadius, y: rect.maxY - (inset + cornerRadius))
        result.addArc(center: pivotBL, radius: cornerRadius, startAngle: Angle.degrees(90.0), endAngle: Angle.degrees(180.0), clockwise: false)
        
        result.addLine(to: CGPoint(x: inset, y: inset + cornerRadius))
        
        let pivotTL = CGPoint(x: inset + cornerRadius, y: inset + cornerRadius)
        result.addArc(center: pivotTL, radius: cornerRadius, startAngle: Angle.degrees(180.0), endAngle: Angle.degrees(270.0), clockwise: false)
        
        return result
    }
}
