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
    @State var toggleLegend: Bool = false
    
    var body: some View {
       
        VStack(alignment:.center) {
            Chart {
                BarMark(x: .value("Day", "Sun"),y: .value("Sales", 100))
                    .annotation {
                        Image(systemName: "figure.walk.circle.fill")
                            .foregroundStyle(Color.blueViolet)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    .foregroundStyle(by: .value("Day", "Sun"))
                
                BarMark(x: .value("Day", "Mon"),y: .value("Sales", 250))
                    .annotation(position: .top, alignment: .center) {
                        Image(systemName: "figure.dance")
                            .foregroundStyle(Color.orangeRed)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    .foregroundStyle(by: .value("Day", "Mon"))
                
                BarMark(x: .value("Day", "Tue"),y: .value("Sales", 75.3))
                    .foregroundStyle(by: .value("Day", "Tue"))
                
                BarMark(x: .value("Day", "Wed"),y: .value("Sales", 850))
                    .foregroundStyle(by: .value("Day", "Wed"))
                
                BarMark(x: .value("Day", "Thu"),y: .value("Sales", 450))
                    .foregroundStyle(by: .value("Day", "Thu"))
                BarMark(x: .value("Day", "Fri"),y: .value("Sales", 20.23))
                    .foregroundStyle(by: .value("Day", "Fri"))
                BarMark(x: .value("Day", "Sat"),y: .value("Sales", 300))
                    .foregroundStyle(by: .value("Day", "Sat"))
            }
            .chartYScale(domain: min...max)
            .chartYAxis {
                AxisMarks (position: .trailing)
            }
            .chartLegend(toggleLegend ? .hidden : .visible)
            
            Button(action: {
                withAnimation{
                    toggleLegend.toggle()
                }
            }, label: {
                Image(systemName: toggleLegend ? "eye" : "eye.slash")
            })
            .padding()
        }
        .padding()
    }
}

#Preview {
    Demo2View()
}
