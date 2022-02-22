//
//  SettingsRowView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct SettingsRowView: View {
    var title: String
    var value: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text(title)
            
            Spacer()
            
            Text("\(value)")
        } //hstack
        .font(.title3.bold())
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(title: "Maximum Value", value: 12)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
