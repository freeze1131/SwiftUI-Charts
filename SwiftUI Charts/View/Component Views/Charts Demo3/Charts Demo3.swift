//
//  Charts Demo3.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 29.02.2024.
//

import SwiftUI
import Charts


struct Charts_Demo3: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let barColors: [Color]
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Chart {
                    ForEach(dailySales) { item in
                        BarMark(x: .value("Day", item.day), y: .value("Sales", item.sales))
                            .foregroundStyle(by: .value("Day", item.day))
                    }
                }
                
                
            }
            .padding()
            .navigationTitle("Demo 3")
        }
    }
}

#Preview {
    Charts_Demo3(dailySales: defaultDailySales, min: 0, max: 700, barColors: Color.randomColorsN(n: defaultDailySales.count))
}
