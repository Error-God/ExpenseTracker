//
//  ExpenseLineChartVM.swift
//  ExpenseTracker
//
//  Created by Kumar, Govinda on 08/07/24.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    @Published var dailyExpenses: [DailyExpense] = []

    private let expenseTypes = ["Food", "Transport", "Utilities", "Entertainment", "Other"]

    init() {
        generateSampleExpenses()
        generateDailyExpenses()
        printExpenses()
    }

    private func generateSampleExpenses() {
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2024, month: 7, day: 1))!
        let endDate = calendar.date(from: DateComponents(year: 2024, month: 7, day: 31))!

        for date in Date.days(from: startDate, to: endDate) {
            // Randomly decide the number of expenses for this day (0 to 3)
            let numberOfExpenses = Int.random(in: 0...5)
            
            for _ in 0..<numberOfExpenses {
                let amount = round(Double.random(in: 10...100) * 100) / 100.0
                let type = expenseTypes.randomElement()!
                expenses.append(Expense(date: date, type: type, amount: amount))
            }
        }
    }

    private func generateDailyExpenses() {
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2024, month: 7, day: 1))!
        let endDate = calendar.date(from: DateComponents(year: 2024, month: 7, day: 31))!

        for date in Date.days(from: startDate, to: endDate) {
            let dailyTotal = expenses.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
                .reduce(0.0) { $0 + $1.amount }
            dailyExpenses.append(DailyExpense(date: date, totalAmount: dailyTotal))
        }
    }

    private func printExpenses() {
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .short
           dateFormatter.timeStyle = .none
           
           for dailyExpense in dailyExpenses {
               let date = dateFormatter.string(from: dailyExpense.date)
               print("Date: \(date)")
               
               for expense in expenses where Calendar.current.isDate(expense.date, inSameDayAs: dailyExpense.date) {
                   print("    Amount: \(expense.amount)")
               }
               print("Total: \(dailyExpense.totalAmount)")
           }
       }
}

struct DailyExpense: Identifiable {
    var date: Date
    var totalAmount: Double
    var id = UUID()
}
