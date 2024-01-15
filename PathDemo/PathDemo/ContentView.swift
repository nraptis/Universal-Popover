//
//  ContentView.swift
//  PathDemo
//
//  Created by Nicky Taylor on 11/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var inset: CGFloat = 14.0
    @State var cornerRadius: CGFloat = 12.0
    @State var handleCenterOffset: CGFloat = 20.0
    @State var handleLength: CGFloat = 10.0
    @State var handleWidthBase: CGFloat = 10.0
    @State var controlPointOffsetBase: CGFloat = 5.5
    @State var controlPointOffsetTip: CGFloat = 4.0
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Text("Inset:")
                    Slider(value: $inset, in: 0...20)
                    Text("\(inset)")
                }
                HStack {
                    Text("CornerRadius:")
                    Slider(value: $cornerRadius, in: 4...16)
                    Text("\(cornerRadius)")
                }
                HStack {
                    Text("Offset:")
                    Slider(value: $handleCenterOffset, in: 0...40)
                    Text("\(handleCenterOffset)")
                }
                HStack {
                    Text("handleLength:")
                    Slider(value: $handleLength, in: 0...18)
                    Text("\(handleLength)")
                }
                HStack {
                    Text("handleWidthBase:")
                    Slider(value: $handleWidthBase, in: 4...24)
                    Text("\(handleWidthBase)")
                }
                HStack {
                    Text("controlPointOffsetBase:")
                    Slider(value: $controlPointOffsetBase, in: 0...30)
                    Text("\(controlPointOffsetBase)")
                }
                HStack {
                    Text("controlPointOffsetBase:")
                    Slider(value: $controlPointOffsetTip, in: 0...30)
                    Text("\(controlPointOffsetTip)")
                }
            }
            
            HStack {
                ZStack {
                    Text("Blah Blah Blah")
                        .padding(.all, 24)
                }
                .background(BubbleLeft(cornerRadius: cornerRadius, inset: inset, handleCenterOffset: handleCenterOffset, handleLength: handleLength, handleWidthBase: handleWidthBase, handleControlPointOffsetBase: controlPointOffsetBase, handleControlPointOffsetTip: controlPointOffsetTip).foregroundColor(.green))
                .background(BubbleLeft(cornerRadius: cornerRadius, inset: inset, handleCenterOffset: handleCenterOffset, handleLength: handleLength, handleWidthBase: handleWidthBase, handleControlPointOffsetBase: controlPointOffsetBase, handleControlPointOffsetTip: controlPointOffsetTip).stroke().foregroundColor(.black))
                .background(Color.gray)
                Spacer()
            }
            
            HStack {
                Spacer()
                ZStack {
                    Text("Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah")
                        .padding(.all, 24)
                }
                .background(BubbleRight(cornerRadius: cornerRadius, inset: inset, handleCenterOffset: handleCenterOffset, handleLength: handleLength, handleWidthBase: handleWidthBase, handleControlPointOffsetBase: controlPointOffsetBase, handleControlPointOffsetTip: controlPointOffsetTip).foregroundColor(.green))
                .background(BubbleRight(cornerRadius: cornerRadius, inset: inset, handleCenterOffset: handleCenterOffset, handleLength: handleLength, handleWidthBase: handleWidthBase, handleControlPointOffsetBase: controlPointOffsetBase, handleControlPointOffsetTip: controlPointOffsetTip).stroke().foregroundColor(.black))
                .background(Color.gray)
                
            }
            

            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
