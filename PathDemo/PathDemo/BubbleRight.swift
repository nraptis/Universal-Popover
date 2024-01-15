//
//  BubbleRight.swift
//  PathDemo
//
//  Created by Nicky Taylor on 11/21/22.
//

import SwiftUI

struct BubbleRight: Shape {
    
    let cornerRadius: CGFloat
    let inset: CGFloat
    
    let handleCenterOffset: CGFloat
    let handleLength: CGFloat
    let handleWidthBase: CGFloat
    let handleControlPointOffsetBase: CGFloat
    let handleControlPointOffsetTip: CGFloat
    
    /*
    init(cornerRadius: CGFloat, inset: CGFloat, handleCenterOffset: CGFloat,
         handleLength: CGFloat, handleWidthBase: CGFloat, handleControlPointOffsetBase: CGFloat, handleControlPointOffsetTip: CGFloat) {
        self.cornerRadius = cornerRadius
        self.inset = inset
        self.handleCenterOffset = handleCenterOffset
        self.handleWidthBase = handleWidthBase
        self.handleControlPointOffsetBase = handleControlPointOffsetBase
        self.handleControlPointOffsetTip = handleControlPointOffsetTip
    }
    */
    
    func path(in rect: CGRect) -> Path {
        
        var result = Path()
        
        //top line
        result.move(to: CGPoint(x: inset + cornerRadius, y: inset))
        result.addLine(to: CGPoint(x: rect.maxX - (inset + cornerRadius), y: inset))
        
        //top right
        let pivotTR = CGPoint(x: rect.maxX - (inset + cornerRadius), y: inset + cornerRadius)
        result.addArc(center: pivotTR, radius: cornerRadius, startAngle: Angle.degrees(270), endAngle: Angle.degrees(360), clockwise: false)
        
        //right line
        
        let handleCenterY = inset + handleCenterOffset
        let handleBottomY = handleCenterY + handleWidthBase
        let handleTopY = handleCenterY - handleWidthBase
        
        let handleTipX: CGFloat = (rect.maxX - inset) + handleLength
        
        result.addLine(to: CGPoint(x: rect.maxX - inset, y: handleTopY))
        
        result.addCurve(to: CGPoint(x: handleTipX, y: handleCenterY),
                        control1: CGPoint(x: rect.maxX - inset, y: handleTopY + handleControlPointOffsetBase),
                        control2: CGPoint(x: handleTipX, y: handleCenterY - handleControlPointOffsetTip))
        

        result.addCurve(to: CGPoint(x: rect.maxX - inset, y: handleBottomY),
                        control1: CGPoint(x: handleTipX, y: handleCenterY + handleControlPointOffsetTip),
                        control2: CGPoint(x: rect.maxX - inset, y: handleBottomY - handleControlPointOffsetBase))
         
        result.addLine(to: CGPoint(x: rect.maxX - inset, y: rect.maxY - (inset + cornerRadius)))
        
        //bottom right
        let pivotBR = CGPoint(x: rect.maxX - (inset + cornerRadius), y: rect.maxY - (inset + cornerRadius))
        result.addArc(center: pivotBR, radius: cornerRadius, startAngle: Angle.degrees(0), endAngle: Angle.degrees(90), clockwise: false)
        
        //bottom line
        result.addLine(to: CGPoint(x: inset + cornerRadius, y: rect.maxY - inset))
        
        //bottom left
        let pivotBL = CGPoint(x: inset + cornerRadius, y: rect.maxY - (inset + cornerRadius))
        result.addArc(center: pivotBL, radius: cornerRadius, startAngle: Angle.degrees(90), endAngle: Angle.degrees(180), clockwise: false)
        
        
        
        result.addLine(to: CGPoint(x: inset, y: inset + cornerRadius))
        
        
        
        let pivotTL = CGPoint(x: inset + cornerRadius, y: inset + cornerRadius)
        result.addArc(center: pivotTL, radius: cornerRadius, startAngle: Angle.degrees(180), endAngle: Angle.degrees(270), clockwise: false)
        
        /*
        result.move(to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius))
        result.addLine(to: CGPoint(x: rect.minX, y: handleOffset))
        result.addCurve(
            to: CGPoint(x: rect.minX, y: handleOffset - handleSize),
            control1: CGPoint(x: rect.minX - handleSize, y: handleOffset),
            control2: CGPoint(x: rect.minX, y: handleOffset - handleSize / 2)
        )
        result.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 270),
            clockwise: false
        )
        result.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        result.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        result.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )
        */
        return result
    }
}
