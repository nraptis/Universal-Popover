//
//  ApplicationController.swift
//  Invisible Cyclopse
//
//  Created by Dr. Handsome on 11/8/23.
//

import Foundation
import Metal

final class ApplicationController {
    
    static let shared = ApplicationController()
    private init() {
        
    }
    
    static var rootViewModel: RootViewModel!
    static var rootViewController: RootViewController!
    static let device = Device()
    
    static var widthPortrait: CGFloat { device.widthPortrait }
    static var heightPortrait: CGFloat { device.heightPortrait }
    static var widthLandscape: CGFloat { device.widthLandscape }
    static var heightLandscape: CGFloat { device.heightLandscape }
    
    static var widthPortraitScaled: CGFloat { device.widthPortraitScaled }
    static var heightPortraitScaled: CGFloat { device.heightPortraitScaled }
    static var widthLandscapeScaled: CGFloat { device.widthLandscapeScaled }
    static var heightLandscapeScaled: CGFloat { device.heightLandscapeScaled }
    
    func wake() {
        
    }
    
}
