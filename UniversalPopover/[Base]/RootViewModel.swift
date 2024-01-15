//
//  RootViewModel.swift
//  Invisible Cyclopse
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

final class RootViewModel {
    
    var orientation: Orientation
    let window: UIWindow
    let windowScene: UIWindowScene
    init(orientation: Orientation,
         window: UIWindow,
         windowScene: UIWindowScene) {
        self.orientation = orientation
        self.window = window
        self.windowScene = windowScene
        
        ApplicationController.shared.wake()
    }
    
    func pushToLandscapeAndPortrait(reversed: Bool, animated: Bool) {
        let landscapeAndPortraitViewModel = LandscapeAndPortraitViewModel(rootViewModel: self)
        let landscapeAndPortraitViewController = LandscapeAndPortraitViewController(landscapeAndPortraitViewModel: landscapeAndPortraitViewModel)
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        ApplicationController.rootViewController.push(viewController: landscapeAndPortraitViewController,
                                                      fromOrientation: fromOrientation,
                                                      toOrientation: toOrientation,
                                                      fixedOrientation: false,
                                                      animated: animated,
                                                      reversed: reversed)
    }
}
