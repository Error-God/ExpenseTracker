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

    var body: some View {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            
            homePage.tabItem {Image(systemName: "house")
            Text("Home")}.tag("Home")
            
            addExpense.tabItem {Image(systemName: "plus.square.fill.on.square.fill")
                Text("Add Expense")}.tag("AddExpense")
            
            expenseChart.tabItem {Image(systemName: "text.badge.checkmark")
                Text("View Expense")}.tag("ViewExpense")
                        
            header.tabItem {Image(systemName: "list.bullet")
                Text("Categories")}.tag("Categories")
            
            expenseActions.tabItem {Image(systemName: "square.and.arrow.down.on.square.fill")
                Text("Dowload")}.tag("Dowload")
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
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Blue")
                }
                .padding()
            }
            
        }
        .padding()
    }
    
    
    var addExpense: some View{
        var _: Double? = 0.0
        var _: String? = ""
        return VStack{
            HStack{
                Text("Add Expense")
                    .font(.largeTitle)
                    .padding(.horizontal)
                Spacer()
                Button("Save") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.trailing)
            }
                Form {
                    HStack{
                        Text("Description")
                        Text("*")
                            .foregroundStyle(Color(.red))
                        TextField("Desc", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    HStack{
                        Text("Amount")
                        Text("*")
                            .foregroundStyle(Color(.red))
                        TextField("Amt", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                        .padding()
                }
                .frame(height: 300)
                .padding(.top)
            
            Text("Category: ")
                .padding()
            Text("Total amount spent: ")
                .padding()
            Spacer()
                .padding()
            
        }
    }
    
    var expenseActions: some View{
        return VStack{
            HStack{

                Button("Add") {
                    print("Add expense pressed")
                }
                .safeAreaPadding()
                .foregroundColor(.white)
                .background(Color(uiColor: .blue))
                .shadow(radius: 5)
                .clipShape(.capsule)
                
                
                Button("View") {
                    print("Add expense pressed")
                }
                .safeAreaPadding()
                .foregroundColor(.white)
                .background(Color(uiColor: .blue))
                .shadow(radius: 5)
                .clipShape(.capsule)
                
                
                Button("Category") {
                    print("Add expense pressed")
                }
                .safeAreaPadding()
                .foregroundColor(.white)
                .background(Color(uiColor: .blue))
                .shadow(radius: 5)
                .clipShape(.capsule)
                
                
                Button("Dowload") {
                    print("Dowload pressed")
                }
                .safeAreaPadding()
                .foregroundColor(.white)
                .background(Color(uiColor: .blue))
                .shadow(radius: 5)
                .clipShape(.capsule)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView( appUserName: "Tom")
}
