//
//  Demo3 Data.swift
//  SwiftUI Charts
//
//  Created by Ahmet Ozen on 29.02.2024.
//

import Foundation

struct DailySalesType: Identifiable {
    let id = UUID()
    let day: String
    let sales: Int
}

let defaultDailySales: [DailySalesType] = [
    .init(day: "Sun", sales: 31),
    .init(day: "Mon", sales: 80),
    .init(day: "Tue", sales: 131),
    .init(day: "Wed", sales: 331),
    .init(day: "Thu", sales: 31),
    .init(day: "Fri", sales: 7),
    .init(day: "Sat", sales: 79),

]
