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
    let side: MysticPopoverBubbleView.Side
    let arrowPosition: MysticPopoverBubbleView.ArrowPosition
    
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
        result.isUserInteractionEnabled = false
        return result
    }()
    
    lazy var popoverBubbleHostingController: UIHostingController<MysticPopoverBubbleView> = {
        var result = UIHostingController(rootView: MysticPopoverBubbleView(side: side, arrowPosition: arrowPosition))
        result.view.backgroundColor = .clear
        result.view.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    
    lazy var popoverUnderlayHostingController: UIHostingController<MysticCompactUnderlayView> = {
        var result = UIHostingController(rootView: MysticCompactUnderlayView())
        result.view.backgroundColor = .clear
        result.view.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    private static var isLargeScreen: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .mac {
            return true
        } else {
            return false
        }
    }
    
    lazy var contentContainer: UIView = {
        
        if Self.isLargeScreen {
            
            let result = UIView(frame: .zero)
            result.translatesAutoresizingMaskIntoConstraints = false
            
            
            if let bubbleView = popoverBubbleHostingController.view {
                result.addSubview(bubbleView)
                result.addConstraints([
                    NSLayoutConstraint(item: bubbleView, attribute: .left, relatedBy: .equal, toItem: result, attribute: .left, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: bubbleView, attribute: .right, relatedBy: .equal, toItem: result, attribute: .right, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: bubbleView, attribute: .top, relatedBy: .equal, toItem: result, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: bubbleView, attribute: .bottom, relatedBy: .equal, toItem: result, attribute: .bottom, multiplier: 1.0, constant: 0.0)
                ])
            }
            
            return result
        } else {
            let result = UIView(frame: .zero)
            result.translatesAutoresizingMaskIntoConstraints = false
            
            if let underlayView = popoverUnderlayHostingController.view {
                result.addSubview(underlayView)
                result.addConstraints([
                    NSLayoutConstraint(item: underlayView, attribute: .left, relatedBy: .equal, toItem: result, attribute: .left, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: underlayView, attribute: .right, relatedBy: .equal, toItem: result, attribute: .right, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: underlayView, attribute: .top, relatedBy: .equal, toItem: result, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: underlayView, attribute: .bottom, relatedBy: .equal, toItem: result, attribute: .bottom, multiplier: 1.0, constant: 0.0)
                ])
            }
            return result
        }
    }()
    
    lazy var contentContainerCompactSafeAreaPaddingViewBottom: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        //result.backgroundColor = UIColor.orange.withAlphaComponent(0.25)
        //result.layer.cornerRadius = 16.0
        //result.clipsToBounds = true
        return result
    }()
    
    lazy var contentContainerCompactSafeAreaPaddingViewLeft: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        //result.backgroundColor = UIColor.yellow.withAlphaComponent(0.25)
        //result.layer.cornerRadius = 16.0
        //result.clipsToBounds = true
        return result
    }()
    
    lazy var contentContainerCompactSafeAreaPaddingViewRight: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        //result.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
        //result.layer.cornerRadius = 16.0
        //result.clipsToBounds = true
        return result
    }()
    
    lazy var sourceViewConstraintX: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .left,
                           multiplier: 1.0,
                           constant: sourceRect.minX)
    }()
    
    lazy var sourceViewConstraintY: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: sourceRect.minY)
    }()
    
    lazy var sourceViewConstraintWidth: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: sourceRect.width)
    }()
    
    lazy var sourceViewConstraintHeight: NSLayoutConstraint = {
        NSLayoutConstraint(item: sourceView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0, constant: sourceRect.height)
    }()
    
    init(identifier: String,
         sourceRect: CGRect,
         offset: CGFloat,
         viewController: UIViewController,
         contentWidth: CGFloat,
         contentHeight: CGFloat,
         side: MysticPopoverBubbleView.Side,
         arrowPosition: MysticPopoverBubbleView.ArrowPosition) {
        self.identifier = identifier
        self.sourceRect = sourceRect
        self.offset = offset
        self.viewController = viewController
        self.contentWidth = contentWidth
        self.contentHeight = contentHeight
        self.side = side
        self.arrowPosition = arrowPosition
        
        super.init(frame: .zero)
        
        if Self.isLargeScreen {
            
            addSubview(sourceView)
            sourceView.addConstraints([
                sourceViewConstraintWidth,
                sourceViewConstraintHeight
            ])
            
            addConstraints([
                sourceViewConstraintX,
                sourceViewConstraintY,
            ])
            
            addSubview(contentContainer)
            
            switch side {
            case .left:
                addConstraints([
                    NSLayoutConstraint(item: contentContainer, attribute: .right, relatedBy: .equal, toItem: sourceView, attribute: .left, multiplier: 1.0, constant: -offset),
                    
                ])
            case .right:
                addConstraints([
                    NSLayoutConstraint(item: contentContainer, attribute: .left, relatedBy: .equal, toItem: sourceView, attribute: .right, multiplier: 1.0, constant: offset),
                    
                ])
            }
            contentContainer.addConstraints([
                NSLayoutConstraint(item: contentContainer, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentWidth + MysticPopoverBubbleConstants.inset + MysticPopoverBubbleConstants.inset),
                NSLayoutConstraint(item: contentContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentHeight + MysticPopoverBubbleConstants.inset + MysticPopoverBubbleConstants.inset),
            ])
            
            addConstraints([
                NSLayoutConstraint(item: contentContainer, attribute: .centerY, relatedBy: .equal, toItem: sourceView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
            ])
            
            if let viewControllerView = viewController.view {
                viewControllerView.translatesAutoresizingMaskIntoConstraints = false
                contentContainer.addSubview(viewControllerView)
                viewController.view.addConstraints([
                    NSLayoutConstraint(item: viewControllerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentWidth),
                    NSLayoutConstraint(item: viewControllerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentHeight),
                ])
                
                contentContainer.addConstraints([
                    NSLayoutConstraint(item: viewControllerView, attribute: .centerX, relatedBy: .equal, toItem: contentContainer, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: viewControllerView, attribute: .centerY, relatedBy: .equal, toItem: contentContainer, attribute: .centerY, multiplier: 1.0, constant: 0.0)
                ])
            }
        } else {
            
            
            addSubview(contentContainer)
            
            
            addConstraints([
                NSLayoutConstraint(item: contentContainer, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainer, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainer, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            ])
            
            contentContainer.addSubview(contentContainerCompactSafeAreaPaddingViewBottom)
            addConstraint(
                contentContainerCompactSafeAreaPaddingViewBottom.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            )
            contentContainer.addConstraints([
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewBottom, attribute: .left, relatedBy: .equal, toItem: contentContainer, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewBottom, attribute: .right, relatedBy: .equal, toItem: contentContainer, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewBottom, attribute: .bottom, relatedBy: .equal, toItem: contentContainer, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            ])
            
            
            contentContainer.addSubview(contentContainerCompactSafeAreaPaddingViewLeft)
            addConstraint(
                contentContainerCompactSafeAreaPaddingViewLeft.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor)
            )
            contentContainer.addConstraints([
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewLeft, attribute: .top, relatedBy: .equal, toItem: contentContainer, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewLeft, attribute: .bottom, relatedBy: .equal, toItem: contentContainer, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewLeft, attribute: .left, relatedBy: .equal, toItem: contentContainer, attribute: .left, multiplier: 1.0, constant: 0.0)
            ])
            
            
            contentContainer.addSubview(contentContainerCompactSafeAreaPaddingViewRight)
            addConstraint(
                contentContainerCompactSafeAreaPaddingViewRight.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
            )
            contentContainer.addConstraints([
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewRight, attribute: .top, relatedBy: .equal, toItem: contentContainer, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewRight, attribute: .bottom, relatedBy: .equal, toItem: contentContainer, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: contentContainerCompactSafeAreaPaddingViewRight, attribute: .right, relatedBy: .equal, toItem: contentContainer, attribute: .right, multiplier: 1.0, constant: 0.0)
            ])
            
            
            if let viewControllerView = viewController.view {
                viewControllerView.translatesAutoresizingMaskIntoConstraints = false
                contentContainer.addSubview(viewControllerView)
                viewController.view.addConstraints([
                    NSLayoutConstraint(item: viewControllerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentHeight),
                ])
                
                contentContainer.addConstraints([
                    NSLayoutConstraint(item: viewControllerView, attribute: .left, relatedBy: .equal, toItem: contentContainerCompactSafeAreaPaddingViewLeft, attribute: .right, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: viewControllerView, attribute: .right, relatedBy: .equal, toItem: contentContainerCompactSafeAreaPaddingViewRight, attribute: .left, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: viewControllerView, attribute: .bottom, relatedBy: .equal, toItem: contentContainerCompactSafeAreaPaddingViewBottom, attribute: .top, multiplier: 1.0, constant: 0.0)
                ])
                
                addConstraint(NSLayoutConstraint(item: contentContainer, attribute: .top, relatedBy: .equal, toItem: viewControllerView, attribute: .top, multiplier: 1.0, constant: 0.0))
            }
            
            
            
            
            /*
            contentContainer.addConstraints([
                NSLayoutConstraint(item: contentContainer, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentWidth + MysticPopoverBubbleConstants.inset + MysticPopoverBubbleConstants.inset),
                NSLayoutConstraint(item: contentContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: contentHeight + MysticPopoverBubbleConstants.inset + MysticPopoverBubbleConstants.inset),
            ])
            
            addConstraints([
                NSLayoutConstraint(item: contentContainer, attribute: .centerY, relatedBy: .equal, toItem: sourceView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
            ])
            
            
            
            
            contentContainerCompactSafeAreaPaddingViewLeft
            contentContainerCompactSafeAreaPaddingViewRight
            
            */
            
            
        }
        
        
        
        
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
        RootViewController.shared.hideMysticalPopover()
    }
}

extension MysticPopoverContainer: UIGestureRecognizerDelegate {
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let position = gestureRecognizer.location(in: self)
        return !contentContainer.frame.contains(position)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let position = touch.location(in: self)
        return !contentContainer.frame.contains(position)
    }
}
