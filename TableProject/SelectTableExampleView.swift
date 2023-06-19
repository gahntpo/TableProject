//
//  SelectTableExampleView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct SelectTableExampleView: View {
    @State private var customers: [Customer] = Customer.examples()
    @State private var selection: Set<Customer.ID> = []
    
    var body: some View {
        Table(customers, selection: $selection) {
            TableColumn("name", value: \.name)
            TableColumn("email", value: \.email)
            TableColumn("joined at") { customer in
                Text(customer.creationDate, style: .date)
            }
            
        }
    }
}


struct SelectTableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTableExampleView()
    }
}
