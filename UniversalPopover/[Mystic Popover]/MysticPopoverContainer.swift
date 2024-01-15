//
//  MysicPopoverContainer.swift
//  UniversalPopover
//
//  Created by Nicky Taylor on 1/14/24.
//

import UIKit
import SwiftUI

class MysticPopoverContainer: UIView {
    
    let identifier: String
    let sourceRect: CGRect
    let offset: CGFloat
    let viewController: UIViewController
    let contentWidth: CGFloat
    let contentHeight: CGFloat
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let result = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        result.delegate = self
        result.cancelsTouchesInView = false
        result.numberOfTapsRequired = 1
        result.delaysTouchesEnded = false
        return result
    }()
    
    lazy var sourceView: UIView = {
        let result = UIView(frame: .zero)
        result.layer.cornerRadius = 12.0
        result.backgroundColor = UIColor.red.withAlphaComponent(0.65)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var sourceViewConstraintX: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: sourceRect.minX)
    }()
    
    lazy var sourceViewConstraintY: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: sourceRect.minY)
    }()
    
    lazy var sourceViewConstraintWidth: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: sourceRect.width)
    }()
    
    lazy var sourceViewConstraintHeight: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: sourceRect.height)
    }()
    
    init(identifier: String,
         sourceRect: CGRect,
         offset: CGFloat,
         viewController: UIViewController,
         contentWidth: CGFloat,
         contentHeight: CGFloat) {
        self.identifier = identifier
        self.sourceRect = sourceRect
        self.offset = offset
        self.viewController = viewController
        self.contentWidth = contentWidth
        self.contentHeight = contentHeight
        
        super.init(frame: .zero)
        
        addSubview(sourceView)
        sourceView.addConstraints([
            sourceViewConstraintWidth,
            sourceViewConstraintHeight
        ])
        
        addConstraints([
            sourceViewConstraintX,
            sourceViewConstraintY,
        ])
        
        if let viewControllerView = viewController.view {
            viewControllerView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(viewControllerView)
            viewController.view.addConstraints([
                NSLayoutConstraint(item: viewControllerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentWidth),
                NSLayoutConstraint(item: viewControllerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentHeight),
            ])
            
            addConstraints([
                NSLayoutConstraint(item: viewControllerView, attribute: .right, relatedBy: .equal, toItem: sourceView, attribute: .left, multiplier: 1.0, constant: -offset),
                NSLayoutConstraint(item: viewControllerView, attribute: .centerY, relatedBy: .equal, toItem: sourceView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
            ])
        }
        
        backgroundColor = UIColor.orange.withAlphaComponent(0.4)
        
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(sourceRect: CGRect) {
        sourceViewConstraintX.constant = sourceRect.minX
        sourceViewConstraintY.constant = sourceRect.minY
        sourceViewConstraintWidth.constant = sourceRect.width
        sourceViewConstraintHeight.constant = sourceRect.height
    }
    
    @objc func didTap(_ tapGestureRecognizer: UITapGestureRecognizer) -> Void {
        print("did tapp")
        
        RootViewController.shared.hideMysticalPopover()
    }
    
}

extension MysticPopoverContainer: UIGestureRecognizerDelegate {
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let position = gestureRecognizer.location(in: self)
        if sourceView.frame.contains(position) {
            print("Out of Frame, SB!!!")
            return false
        } else {
            print("In Frame, SB!!!")
            return true
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let position = touch.location(in: self)
        if sourceView.frame.contains(position) {
            print("Out of Frame, TOUCH!!!")
            return false
        } else {
            print("In Frame, TOUCH!!!")
            return true
        }
    }
}
