//
//  ExpenseChartVM.swift
//  ExpenseTracker
//
//  Created by Kumar, Govinda on 02/07/24.
//
import SwiftUI

class ExpenseVM {
    
    // 1
    static func getDummyExpenses() -> [Expense] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy"

        let data: [Expense] = [
            .init(date: dateFormatter.date(from: "12/1/2022") ?? Date(), type: "Food", amount: 55.0),
            .init(date: dateFormatter.date(from: "12/1/2022") ?? Date(), type: "Shopping", amount: 44.0),
            .init(date: dateFormatter.date(from: "12/1/2022") ?? Date(), type: "Movie", amount: 24.0),
            .init(date: dateFormatter.date(from: "11/1/2023") ?? Date(), type: "Food", amount: 103.0),
            .init(date: dateFormatter.date(from: "11/4/2023") ?? Date(), type: "Movie", amount: 76.0),
            .init(date: dateFormatter.date(from: "10/1/2023") ?? Date(), type: "Food", amount: 103.0),
            .init(date: dateFormatter.date(from: "10/2/2023") ?? Date(), type: "Food", amount: 10.0),
            .init(date: dateFormatter.date(from: "10/3/2023") ?? Date(), type: "Food", amount: 30.0),
            .init(date: dateFormatter.date(from: "9/4/2023") ?? Date(), type: "Movie", amount: 85.0),
            .init(date: dateFormatter.date(from: "9/6/2023") ?? Date(), type: "Movie", amount: 12.0),
            .init(date: dateFormatter.date(from: "9/17/2023") ?? Date(), type: "Movie", amount: 50.0),
            .init(date: dateFormatter.date(from: "8/1/2023") ?? Date(), type: "Food", amount: 10.0),
            .init(date: dateFormatter.date(from: "8/6/2023") ?? Date(), type: "Food", amount: 40.0),
            .init(date: dateFormatter.date(from: "8/9/2023") ?? Date(), type: "Food", amount: 80.0),
            .init(date: dateFormatter.date(from: "7/4/2023") ?? Date(), type: "Movie", amount: 20.0),
            .init(date: dateFormatter.date(from: "7/24/2023") ?? Date(), type: "Movie", amount: 60.0),
            .init(date: dateFormatter.date(from: "7/14/2023") ?? Date(), type: "Movie", amount: 20.0),
            .init(date: dateFormatter.date(from: "6/1/2023") ?? Date(), type: "Food", amount: 103.0),
            .init(date: dateFormatter.date(from: "6/12/2023") ?? Date(), type: "Food", amount: 10.0),
            .init(date: dateFormatter.date(from: "6/15/2023") ?? Date(), type: "Food", amount: 56.0),
            .init(date: dateFormatter.date(from: "5/4/2023") ?? Date(), type: "Movie", amount: 30.0),
            .init(date: dateFormatter.date(from: "5/6/2023") ?? Date(), type: "Movie", amount: 50.0),
            .init(date: dateFormatter.date(from: "5/9/2023") ?? Date(), type: "Movie", amount: 10.0),
            .init(date: dateFormatter.date(from: "5/14/2023") ?? Date(), type: "Movie", amount: 80.0),
            .init(date: dateFormatter.date(from: "5/3/2023") ?? Date(), type: "Movie", amount: 70.0),
            .init(date: dateFormatter.date(from: "4/1/2023") ?? Date(), type: "Food", amount: 103.0),
            .init(date: dateFormatter.date(from: "4/4/2023") ?? Date(), type: "Food", amount: 10.0),
            .init(date: dateFormatter.date(from: "4/7/2023") ?? Date(), type: "Food", amount: 50.0),
            .init(date: dateFormatter.date(from: "3/4/2023") ?? Date(), type: "Movie", amount: 40.0),
            .init(date: dateFormatter.date(from: "3/5/2023") ?? Date(), type: "Movie", amount: 12.0),
            .init(date: dateFormatter.date(from: "3/6/2023") ?? Date(), type: "Movie", amount: 87.0),
            .init(date: dateFormatter.date(from: "2/4/2023") ?? Date(), type: "Movie", amount: 95.0),
            .init(date: dateFormatter.date(from: "2/5/2023") ?? Date(), type: "Movie", amount: 15.0),
            .init(date: dateFormatter.date(from: "2/6/2023") ?? Date(), type: "Movie", amount: 15.0),
            .init(date: dateFormatter.date(from: "1/4/2023") ?? Date(), type: "Movie", amount: 44.0),
            .init(date: dateFormatter.date(from: "1/5/2023") ?? Date(), type: "Movie", amount: 84.0),
            .init(date: dateFormatter.date(from: "1/6/2023") ?? Date(), type: "Movie", amount: 44.0)
        ]

        return data
    }
    
    // 2.
    static func expensesByMonth(_ month: Int) -> [Expense] {
        return ExpenseVM.getDummyExpenses().filter {
        Calendar.current.component(.month, from: $0.date) == month + 1
      }
    }
    
}
