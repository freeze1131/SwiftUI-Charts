//
//  ContentView.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 13.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Demo 1", destination: TestColorButtonView(colors: Color.defaultColors))
            NavigationLink("Demo 2", destination: Demo2View())
            NavigationLink("Demo 3", destination:  Charts_Demo3(dailySales: defaultDailySales, min: 0, max: 700, barColors: Color.randomColorsN(n: defaultDailySales.count)))
            .navigationTitle("Charts")
        }
    }
}

#Preview {
    ContentView()
}
