//
//  CompactTableExampleView.swift
//  TableProject
//
//  Created by Karin Prater on 19.06.23.
//

import SwiftUI

struct CompactTableExampleView: View {
    var body: some View {
        NavigationSplitView {
            SortTableExampleView()
        } detail: {
            SortTableExampleView()
        }
    }
}


struct CompactTableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CompactTableExampleView()
    }
}
