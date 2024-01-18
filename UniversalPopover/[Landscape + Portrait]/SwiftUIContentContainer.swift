//
//  SwiftUIContentContainer.swift
//  UniversalPopover
//
//  Created by Nicky Taylor on 1/14/24.
//

import SwiftUI

struct SwiftUIContentContainer: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { x in
                HStack {
                    ForEach(0..<4) { y in
                        ZStack {
                            ZStack {
                                GeometryReader { geometry in
                                    getButton(x: x, y: y, geometry: geometry)
                                }
                            }
                            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color(red: 0.22, green: 0.22, blue: 0.22)))
                            .padding(.all, 8.0)
                        }
                        
                    }
                }
                .padding(.horizontal, 24.0)
                
            }
            
        }
    }
    
    func getButton(x: Int, y: Int, geometry: GeometryProxy) -> some View {
        
        let hash = "x_\(x)_y_\(y)_id_\(x + y * 4)_xyz"
        
        let width: CGFloat
        if Device.isPhone {
            width = ApplicationController.widthPortrait
        } else {
            width = 420.0
        }
        let height = CGFloat(180.0)
        
        RootViewController.shared.updateMysticalPopover(identifier: hash,
                                                        geometry: geometry)
        
        let viewController = UIHostingController(rootView: PopoverContentView(width: width, height: height))
        viewController.view.backgroundColor = UIColor.clear
        
        return Button(action: {
            
            if y > 1 {
                
                RootViewController.shared.showMysticalPopover(identifier: hash,
                                                              geometry: geometry,
                                                              offset: 6.0,
                                                              viewController: viewController,
                                                              contentWidth: width,
                                                              contentHeight: height,
                                                              side: .left,
                                                              arrowPosition: .middle)
            } else {
                RootViewController.shared.showMysticalPopover(identifier: hash,
                                                              geometry: geometry,
                                                              offset: 6.0,
                                                              viewController: viewController,
                                                              contentWidth: width,
                                                              contentHeight: height,
                                                              side: .right,
                                                              arrowPosition: .middle)
            }
        }, label: {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                        .font(.system(size: 40))
                    Spacer()
                }
                Spacer()
            }
        })
    }
}
