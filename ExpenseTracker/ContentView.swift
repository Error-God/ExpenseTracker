//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Kumar, Govinda on 19/06/24.
//

import SwiftUI
import Foundation
import Charts

struct ContentView: View {
    @State var greeting: String = "Good Morning"
    @State var appUserName: String = "Tim"
    @State var tabInt = "AddExpense"
    
    @StateObject private var viewModel = ExpenseViewModel()

    var body: some View {
        TabView(selection: $tabInt) {
            
            addExpense.tabItem {
                Image(systemName: "plus.square.fill.on.square.fill")
                Text("Add Expense")
            }.tag("AddExpense")
            
            expenseChart.tabItem {
                Image(systemName: "text.badge.checkmark")
                Text("View Expense")
            }.tag("ViewExpense")
            
            homePage.tabItem {
                Image(systemName: "house")
                Text("Home")
            }.tag("Home")
            
            WelcomeScreen().tabItem {
                Image(systemName: "list.bullet")
                Text("Categories")
            }.tag("Categories")
            
            expenseActions.tabItem {
                Image(systemName: "square.and.arrow.down.on.square.fill")
                Text("Dowload")
            }.tag("Dowload")
        }
    }
    
    var homePage: some View{
        return  NavigationView {
                VStack {
                    header
                    
                    expenseChart
                    Spacer()
                }
                .padding()
        }
    }
    
    var header: some View {
        var greet = "Good "
        
        let currentDate = Date()
        let calendar = Calendar.current
        let hour: Int = calendar.component(.hour, from: currentDate)
        
        let name = "Raghav"
        
        //
        if (hour > 1 && hour < 12){
            greet = greet + "Morning!"
        } else if (hour > 12 && hour < 16){
            greet =  greet + "Afternoon!"
        } else if (hour > 16 && hour < 20){
            greet =  greet + "Evening!"
        } else {
            greet =  greet + "Night!"
        }
        
        
        return HStack {
            VStack{
                Text(greet)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            Spacer()
            
            Button(action: {
                // Action for profile button
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .padding(.trailing)
            }
        }
        .padding()
    }
    
    var expenseChart: some View {
        return VStack{
            Text("Expenses this month")
                .font(.body)
                .foregroundColor(.teal)
                .padding(.horizontal)
            
            Chart {
                SectorMark(angle: .value("Red", 22))
                    .foregroundStyle(.red)
                SectorMark(angle: .value("Green", 33))
                    .foregroundStyle(.green)
                SectorMark(angle: .value("Blue", 45))
                    .foregroundStyle(.blue)
            }
            .frame(height: 200)
            .padding(.horizontal)
            
            HStack{
                HStack{
                    Rectangle()
                        .frame(width: 10,height: 10)
                        .foregroundColor(.red)
                    Text("Red")
                }
                .padding()
                HStack{
                    Rectangle()
                        .frame(width: 10,height: 10)
                        .foregroundColor(.green)
                    Text("Green")
                }
                .padding()
                HStack{
                    Rectangle()
                        .frame(width: 10,height: 10)
                        .foregroundColor(.blue)
                    Text("Blue")
                }
                .padding()
            }
            
            VStack {
                Text("Monthly Expenses")
                    .font(.headline)
                
                Chart {
                    ForEach(viewModel.dailyExpenses) { expense in
                        LineMark(
                            x: .value("Date", expense.date, unit: .day),
                            y: .value("Amount", expense.totalAmount)
                        )
                        
                    }
                }
                
            }
            .padding(.top)
        }
        .padding()
    }
    
    
    var addExpense: some View{
        @State var description = ""
        @State var amount = ""
        @State var isAmountValid = true
        
        // Computed property to check if the amount is a valid number
        func isNumber(amount: String) -> Bool {
            return Double(amount) != nil
        }
        return VStack{
            HStack {
                Text("Add Expense")
                    .font(.largeTitle)
                    .padding(.horizontal)
                Spacer()
                Button("Save") {

                    // Validate amount before saving
                    isAmountValid = isNumber(amount: amount)
                    if isAmountValid {
                        // Perform save action here
                        print("Expense Saved")
                    } else {
                        // Handle invalid amount
                        print("Invalid amount")
                    }
                }
                .padding(.trailing)
            }
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("Description")
                                Text("*")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            TextField("Enter description", text: $description)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .padding(.horizontal, 1)
                                .frame(height: 40)
                                .cornerRadius(5)
                        }
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("Amount")
                                Text("*")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            TextField("Enter amount", text: $amount)
                                .disableAutocorrection(true)
                                .padding(.horizontal, 1)
                                .frame(height: 40)
                                .cornerRadius(5)
                            
                            
                            if !isAmountValid {
                                Text("Please enter a valid number.")
                                    .foregroundColor(.red)
                                    .font(.caption)
                            }
                        }
                        Divider()
                        
                        DatePicker("Date", selection: .constant(Date()), displayedComponents: .date)
                            .padding(.vertical, 5)
                    }
                    .padding(.vertical, 10)
                }
            }
            .frame(height: 350)
            
            Text("Category: ")
                .padding()
            Text("Total amount spent: ")
                .padding()
            Spacer()
        }
    }
    
    var expenseActions: some View{
        return VStack{           
        }
        
    }
    
}
    #Preview {
        ContentView( appUserName: "Tom")
    }
