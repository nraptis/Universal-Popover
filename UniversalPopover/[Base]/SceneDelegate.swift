//
//  SceneDelegate.swift
//  Invisible Cyclopse
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        let orientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        
        ApplicationController.rootViewModel = RootViewModel(orientation: orientation,
                                                            window: window,
                                                            windowScene: windowScene)
        ApplicationController.rootViewController = RootViewController(rootViewModel: ApplicationController.rootViewModel)
        
        /*
        let landscapeAndPortraitViewModel = LandscapeAndPortraitViewModel(rootViewModel: ApplicationController.rootViewModel)
        let landscapeAndPortraitViewController = LandscapeAndPortraitViewController(landscapeAndPortraitViewModel: landscapeAndPortraitViewModel)
        ApplicationController.rootViewController.push(viewController: landscapeAndPortraitViewController,
                                                      fromOrientation: orientation,
                                                      toOrientation: orientation,
                                                      fixedOrientation: false,
                                                      animated: false,
                                                      reversed: false)
        */
        
        window.rootViewController = ApplicationController.rootViewController
        window.makeKeyAndVisible()
        
        
        ApplicationController.rootViewModel.pushToLandscapeAndPortrait(reversed: false,
                                                                       animated: false)
        
        
        // This is no longer true, below
        /*
        // The safe area is all 0 right now.
        
        print("Trial 1A, Safe Area: (left: \(window.safeAreaInsets.left), right: \(window.safeAreaInsets.right), top: \(window.safeAreaInsets.top), bottom: \(window.safeAreaInsets.bottom))")
        
        DispatchQueue.main.async {
            
            print("Trial 1B, Safe Area: (left: \(window.safeAreaInsets.left), right: \(window.safeAreaInsets.right), top: \(window.safeAreaInsets.top), bottom: \(window.safeAreaInsets.bottom))")
            
            // The safe area is now populated.
            ApplicationController.rootViewModel.pushToLandscapeAndPortrait(reversed: false,
                                                                           animated: false)
            
        }
        */
    }
}

