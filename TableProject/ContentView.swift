//
//  ContentView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var customers: [Customer] = Customer.examples()
    
    var body: some View {
        
        Table(of: Customer.self) {
            TableColumn("Name", value: \.name)
            TableColumn("Email", value: \.email)
            
            TableColumn("Date") { customer in
                Text(customer.creationDate, style: .date)
            }
        } rows: {
            ForEach(customers) { customer in
                TableRow(customer)
                    .contextMenu {
                        Button("Edit") {
                            // TODO open editor in inspector
                        }
                        Button("See Details") {
                           // TODO open detai view
                        }
                        Divider()
                        
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                    }
            }
            
            TableRow(Customer(name: "Dummy", email: "abc@xwz.com", creationDate: Date()))
        }
       // .tableStyle(.bordered(alternatesRowBackgrounds: false))
       // .alternatingRowBackgrounds(.disabled)
        .scrollDisabled(false)
        //.scrollContentBackground(.hidden)
       // .background(Color.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
