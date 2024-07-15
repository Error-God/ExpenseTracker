//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Kumar, Govinda on 02/07/24.
//

import Foundation

struct Expense: Identifiable {
    var date: Date
    var type: String
    var amount: Double
    var id = UUID()
}
