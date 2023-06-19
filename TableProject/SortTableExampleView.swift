//
//  SortTableExampleView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct SortTableExampleView: View {
    @State private var customers: [Customer] = Customer.examples()
    @State private var sortOrders = [KeyPathComparator(\Customer.name, order: .reverse)]
    
    var body: some View {

        Table(customers, sortOrder: $sortOrders) {
            TableColumn("name", value: \.name)
            TableColumn("email", value: \.email)
            TableColumn("joined at", value: \.formattedDate)
                .width(min: 50, ideal: 100, max: 150)
            TableColumn("isSubscribed", value: \.fomattedisSubscribed) { customer in
                Text(customer.isSubscribed ? "yes" : "no")
            }
            .width(min: 50, ideal: 100, max: 150)
            
        }
        .onChange(of: sortOrders) { newValue in
            customers.sort(using: newValue)
        }
    }
}

struct SortTableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SortTableExampleView()
    }
}

