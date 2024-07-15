//
//  Charts.swift
//  ExpenseTracker
//
//  Created by Kumar, Govinda on 02/07/24.
//


import Foundation

struct ChartData {
    private static let minute: TimeInterval = 60
    private static let hour = minute * 60
    private static let day = hour * 24
    private static let week = day * 7
    private static let month = week * 4
    private static let sixMonth = week * 26
    private static let year = sixMonth * 2
    
    static var lineChartData: [Sale] {
        var sales: [Sale] = []
        
        for i in 1..<50 {
            sales.append(
                .init(id: .init(Sale.self), date: .now.addingTimeInterval(Double(i) * day), count: Int.random(in: 0...1000))
            )
        }
        
        return sales
    }
}
