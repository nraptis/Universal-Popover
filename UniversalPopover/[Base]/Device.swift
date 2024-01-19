//
//  Device.swift
//  Invisible Cyclopse
//
//  Created by Dr. Handsome on 11/8/23.
//

import UIKit

class Device {
    
    let widthPortrait: CGFloat
    let heightPortrait: CGFloat
    let widthLandscape: CGFloat
    let heightLandscape: CGFloat
    
    let widthPortraitScaled: CGFloat
    let heightPortraitScaled: CGFloat
    let widthLandscapeScaled: CGFloat
    let heightLandscapeScaled: CGFloat
    
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isTV: Bool {
        UIDevice.current.userInterfaceIdiom == .tv
    }
    
    static var scale: CGFloat {
        UIScreen.main.scale
    }
    
    init() {
        
        let _screenWidth = CGFloat(Int(UIScreen.main.bounds.size.width + 0.5))
        let _screenHeight = CGFloat(Int(UIScreen.main.bounds.size.height + 0.5))
        
        widthPortrait = _screenWidth < _screenHeight ? _screenWidth : _screenHeight
        heightPortrait = _screenWidth < _screenHeight ? _screenHeight : _screenWidth
        widthLandscape = heightPortrait
        heightLandscape = widthPortrait
        
        widthPortraitScaled = CGFloat(Int(widthPortrait * Self.scale + 0.5))
        heightPortraitScaled = CGFloat(Int(heightPortrait * Self.scale + 0.5))
        widthLandscapeScaled = heightPortraitScaled
        heightLandscapeScaled = widthPortraitScaled
        
        
        print("Device Portrait  [\(String(format: "%.1f", widthPortrait)) x \(String(format: "%.1f", heightPortrait))]")
        print("Device Landscape [\(String(format: "%.1f", widthLandscape)) x \(String(format: "%.1f", heightLandscape))]")
        
        print("Device Portrait Scaled  [\(String(format: "%.1f", widthPortraitScaled)) x \(String(format: "%.1f", heightPortraitScaled))]")
        print("Device Landscape Scaled [\(String(format: "%.1f", widthLandscapeScaled)) x \(String(format: "%.1f", heightLandscapeScaled))]")
        
    }
}
