//
//  CompactAdjustmentSecExampleView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct CompactAdjustmentSecExampleView: View {
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
        if isCompact {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20, content: {
                    ForEach(customers) { customer in
                        VStack(alignment: .leading) {
                            Text(customer.name)
                            Text(customer.email)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal)
                    }
                })
            }
        } else {
            Table(customers) {
                TableColumn("name", value: \.name)
                TableColumn("email", value: \.email)
                TableColumn("joined at") { customer in
                    Text(customer.creationDate, style: .date)
                }
                
            }
        }
    }
}

struct CompactAdjustmentSecExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CompactAdjustmentSecExampleView()
    }
}
