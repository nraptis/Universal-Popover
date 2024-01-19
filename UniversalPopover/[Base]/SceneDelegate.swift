//
//  SceneDelegate.swift
//  Invisible Cyclopse
//
//  Created by Dr. Handsome on 11/8/23.
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
        
        window.rootViewController = ApplicationController.rootViewController
        window.makeKeyAndVisible()
        
        ApplicationController.rootViewModel.pushToLandscapeAndPortrait(reversed: false,
                                                                       animated: false)
    }
}

