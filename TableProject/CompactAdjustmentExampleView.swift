//
//  CompactAdjustmentExampleView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct CompactAdjustmentExampleView: View {
    @State private var customers: [Customer] = Customer.examples()
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizonalSizeClass
    var isCompact: Bool {
        horizonalSizeClass == .compact
    }
    #else
    private let isCompact = false
    #endif
    
    var body: some View {
        Table(customers) {
            TableColumn("name") { customer in
                VStack(alignment: .leading) {
                    Text(customer.name)
                    
                    if isCompact {
                        Text(customer.email)
                            .foregroundStyle(.secondary)
                    }
                }
           }
            
            TableColumn("email", value: \.email)
            TableColumn("joined at") { customer in
                Text(customer.creationDate, style: .date)
            }
            
        }
    }
}

struct CompactAdjustmentExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CompactAdjustmentExampleView()
    }
}
