//
//  Demo2View.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 29.02.2024.
//

import SwiftUI
import Charts

struct Demo2View: View {
    let min = 0.0
    let max = 1000.0
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
        
        Chart {
            BarMark(x: .value("Day", "Sun"),y: .value("Sales", 100))
                .annotation {
                    Image(systemName: "figure.walk.circle.fill")
                        .foregroundStyle(Color.blueViolet)
                        .fontWeight(.bold)
                        .font(.title)
                }
            
            BarMark(x: .value("Day", "Mon"),y: .value("Sales", 250))
                .annotation(position: .top, alignment: .center) {
                    Image(systemName: "figure.dance")
                        .foregroundStyle(Color.orangeRed)
                        .fontWeight(.bold)
                        .font(.title)
                }
            
            BarMark(x: .value("Day", "Tue"),y: .value("Sales", 75.3))
            
            BarMark(x: .value("Day", "Wed"),y: .value("Sales", 850))
            
            BarMark(x: .value("Day", "Thu"),y: .value("Sales", 450))
            
            BarMark(x: .value("Day", "Fri"),y: .value("Sales", 20.23))
            
            BarMark(x: .value("Day", "Sat"),y: .value("Sales", 300))

        }
        .chartYScale(domain: min...max)
        .chartXAxis {
            AxisMarks(position:.bottom)
        }
        .chartYAxis {
            AxisMarks (position: .trailing)
        }
    }
}

#Preview {
    Demo2View()
}
