//
//  ArcView.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 29.02.2024.
//

import SwiftUI

struct ArcView: View {
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTrim: CGFloat
    let endTrim: CGFloat
    let rotate: CGFloat
    
    @State private var finalTrim: CGFloat = 0
    var lineWidth: CGFloat {
        return endRadius - startRadius
    }
    
    var body: some View {
        Circle()
            .trim(from: startTrim,to: finalTrim)
            .stroke(color,style: StrokeStyle(lineWidth: lineWidth,lineCap: .round))
            .rotationEffect(.degrees(rotate))
            .frame(width: endRadius-lineWidth, height: endRadius, alignment: .center)
            .onAppear{
                withAnimation {
                    finalTrim = endTrim
                }
            }
    }
}

#Preview {
    ZStack {
        Circle()
            .stroke()
            .frame(width: 100, height: 100, alignment: .center)
        ArcView(color: .orange, startRadius: 90, endRadius: 100, startTrim: 0.25, endTrim: 0.75, rotate: 30)
    }
}
