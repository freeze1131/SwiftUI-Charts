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
            .navigationTitle("Charts")
        }
    }
}

#Preview {
    ContentView()
}
