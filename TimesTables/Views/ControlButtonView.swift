//
//  ControlButtonView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct ControlButtonView: View {
    var title: String
    var bgGradient: LinearGradient
    
    var body: some View {
        Button {
            // do something
        } label: {
            Text(title.uppercased())
                .fontWeight(.heavy)
                .padding(10)
                .frame(minWidth: 100, minHeight: 66)
                .background(bgGradient)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundColor(.white)
                .shadow(radius: 2)
        } //button
    }
}

struct ControlButtonView_Previews: PreviewProvider {
    static var bgGradient = LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static var previews: some View {
        ControlButtonView(title: "delete", bgGradient: bgGradient)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
