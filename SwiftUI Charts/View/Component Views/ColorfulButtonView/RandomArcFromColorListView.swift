

import SwiftUI

struct RandomArcFromColorListView: View {
    let colors: [Color]
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat
    
    
    // Random constant
    let startTrim = Double.random(in: 0...0.5)
    let endTrim = 1.0
    let rotate = Double.random(in: 0...360)

    // Computed Properties
    var theIndex: CGFloat {
        if index < colors.count && index >= 0 {
            return CGFloat(index)
        } else {
            return 0.0
        }
    }
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var color: Color {
        colors[index]
    }
    var endRadius: CGFloat {
        minRadius + maxRadius / count
    }
  
    
    
    var body: some View {
        ArcView(color: color.opacity(opacity), startRadius: minRadius, endRadius: endRadius, startTrim: startTrim, endTrim: endTrim, rotate: rotate)
    }
}

#Preview {
    RandomArcFromColorListView(colors: Color.defaultColors, index: 0, minRadius: 170, maxRadius: 180, opacity: 0.9)
}
