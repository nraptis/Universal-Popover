//
//  PopoverContentView.swift
//  UniversalPopover
//
//  Created by Nicky Taylor on 1/14/24.
//

import SwiftUI

struct PopoverContentView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack(spacing: 0.0) {
            
            Button(action: {
                
            }, label: {
                HStack {
                    HStack {
                        Text("Button A")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                }
            })
            
            Button(action: {
                
            }, label: {
                HStack {
                    HStack {
                        Text("Button B")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                }
            })
            
            Button(action: {
                
            }, label: {
                HStack {
                    HStack {
                        Text("Button C")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                }
            })
            
            Button(action: {
                RootViewController.shared.hideMysticalPopover()
            }, label: {
                HStack {
                    HStack {
                        Text("Cancel")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "trash")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                }
            })
            
        }
        //.frame(width: width, height: height)
        .frame(height: height)
        
        //.background(RoundedRectangle(cornerRadius: 60.0).stroke().foregroundColor(.pink))
        
    }
}
