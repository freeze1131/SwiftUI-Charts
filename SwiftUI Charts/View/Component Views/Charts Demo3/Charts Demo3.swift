//
//  Charts Demo3.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 29.02.2024.
//

import SwiftUI
import Charts

enum ChartType {
    case bar,line,area
}


struct Charts_Demo3: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let barColors: [Color]
    @State var  chartType: ChartType = .bar
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(dailySales) { item in
                        
                        if isVerticalChart {
                            switch(chartType) {
                            case  .bar:
                                
                                BarMark( x: .value("Sales", item.sales),y: .value("Day", item.day))
                                    .foregroundStyle(by: .value("Day", item.day))
                            case  .line:
                                LineMark( x: .value("Sales", item.sales),y: .value("Day", item.day))
                            case  .area:
                                AreaMark( x: .value("Sales", item.sales),y: .value("Day", item.day))
                            }
                        } else { // Horizontal case
                            switch(chartType) {
                            case  .bar:
                                
                                BarMark( x:.value("Day", item.day) ,y:  .value("Sales", item.sales) )
                                    .foregroundStyle(by: .value("Day", item.day))
                            case  .line:
                                LineMark( x: .value("Day", item.day) ,y: .value("Sales", item.sales))
                            case  .area:
                                AreaMark( x:.value("Day", item.day) , y: .value("Sales", item.sales) )
                            }
                        }
                        
                        
                        
                    }
                }
                .chartLegend(.hidden)
                
                HStack(spacing: 30) {
                    Button(action: {
                        withAnimation {
                            chartType = .bar
                        }
                    }, label: {
                        Text("BAR")
                    })
                    
                    Button(action: {
                        withAnimation {
                            chartType = .line
                        }
                    }, label: {
                        Text("LINE")
                    })
                    
                    Button(action: {
                        withAnimation {
                            chartType = .area
                        }
                    }, label: {
                        Text("AREA")
                    })
                    
                    Button(action: {
                        withAnimation {
                            isVerticalChart.toggle()
                        }
                    }, label: {
                        Image(systemName: "chart.bar.fill")
                            .rotationEffect(.degrees (isVerticalChart ? 90 : 0))
                    })
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
