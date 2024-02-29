//
//  TestColorButtonVie.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 29.02.2024.
//

import SwiftUI

struct TestColorButtonVie: View {
    @State var colors: [Color]
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var barWidth: CGFloat {
        (UIScreen.main.bounds.width / count) - 5
    }
    @State private var rotateBar: Bool = false
    @State private var tiltBar: Double = 0.0
    
    let threshHold = 30.0
    
    
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom,spacing: 5) {
                
                ForEach(colors,id:\.self) { color in
                    let height = Double.random(in: 50...200)
                    BorderedRectangle(color: color, barWidth: barWidth, height: height)
                }
            }
            .rotation3DEffect(
                .degrees(rotateBar ? 180 : 0 ),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .rotation3DEffect(
                .degrees(-tiltBar * 45),
                axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            .gesture (
                DragGesture()
                    .onChanged{ value in
                        withAnimation{
                            if value.translation.width > threshHold {
                                tiltBar = -1
                            } else if value.translation.width < -threshHold {
                                tiltBar = 1
                            } else {
                                tiltBar = 0
                            }
                        }
                    }
            )
            .onTapGesture {
                withAnimation{
                    tiltBar = 0
                }
            }
        }
    }
}



struct BorderedRectangle: View {
    let color: Color
    let barWidth: Double
    let height: Double
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .frame(width: barWidth,height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.7))
    }
}

#Preview {
    TestColorButtonVie(colors: Color.defaultColors)
}
