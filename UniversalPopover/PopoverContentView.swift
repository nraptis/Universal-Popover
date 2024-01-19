//
//  PopoverContentView.swift
//  UniversalPopover
//
//  Created by Dr. Handsome on 1/14/24.
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
                        Text("Michel Bergeron")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "figure.stand.line.dotted.figure.stand")
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
                        Text("Dave Durazzani")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "figure.american.football")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "figure.equestrian.sports")
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
                        Text("Berzzani")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "cloud.bolt.rain.fill")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "cloud.moon.fill")
                            .font(.system(size: 24.0).bold())
                            .foregroundColor(.white)
                        Image(systemName: "snowflake.slash")
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
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal, 16.0)
                    .padding(.vertical, 6.0)
                }
            })
            
        }
        .frame(height: height)
    }
}
