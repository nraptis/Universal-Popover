//
//  LandscapeAndPortraitViewController.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit
import SwiftUI

class LandscapeAndPortraitViewController: UIViewController {
    
    @IBOutlet weak var tabContainer: UIView!
    @IBOutlet weak var contentContainer: UIView!
    
    lazy var hostingView: UIHostingController<SwiftUIContentContainer> = {
        let result = UIHostingController(rootView: SwiftUIContentContainer())
        result.view.backgroundColor = UIColor.clear
        result.view.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    
    let landscapeAndPortraitViewModel: LandscapeAndPortraitViewModel
    required init(landscapeAndPortraitViewModel: LandscapeAndPortraitViewModel) {
        self.landscapeAndPortraitViewModel = landscapeAndPortraitViewModel
        super.init(nibName: "LandscapeAndPortraitViewController", bundle: .main)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentContainer = self.contentContainer {
            contentContainer.addSubview(hostingView.view)
            contentContainer.addConstraints([
                hostingView.view.leftAnchor.constraint(equalTo: contentContainer.leftAnchor),
                hostingView.view.rightAnchor.constraint(equalTo: contentContainer.rightAnchor),
                hostingView.view.topAnchor.constraint(equalTo: contentContainer.topAnchor),
                hostingView.view.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor),
            ])
        }
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        
        if Device.isPad {
            return [.portrait, .portraitUpsideDown, .landscapeLeft, .landscapeRight]
        } else {
            return [.portrait]
        }
        
        
    }
    
}
