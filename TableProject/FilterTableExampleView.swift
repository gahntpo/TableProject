//
//  FilterTableExampleView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct FilterTableExampleView: View {
    @State private var customers: [Customer] = Customer.examples()
    
    @State private var searchText: String = ""
    
    var filteredCustomers: [Customer] {
        if searchText.count < 2 {
            customers
        } else {
            customers.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    @State private var isOnlySubscribedShown: Bool = false
    
    var body: some View {
        NavigationStack {
            
            Table(filteredCustomers) {
                TableColumn("name", value: \.name)
                TableColumn("email", value: \.email)
                TableColumn("joined at", value: \.formattedDate)
                
                TableColumn("isSubscribed") { customer in
                    Text(customer.isSubscribed ? "yes" : "no")
                }
                
            }
            .searchable(text: $searchText)
            .toolbar(content: {
                Toggle(isOnlySubscribedShown ? "subscribed customers" : "all customers", isOn: $isOnlySubscribedShown)
            })
            
        }
    }
}


struct FilterTableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        FilterTableExampleView()
    }
}
