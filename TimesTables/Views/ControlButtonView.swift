//
//  ControlButtonView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct ControlButtonView: View {
    @Binding var answerString: String
    
    var title: String
    var bgGradient: LinearGradient
    var execute: () -> Void
    
    var body: some View {
        Button {
            execute()
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
        .disabled(answerString.isEmpty)
    }
}

struct ControlButtonView_Previews: PreviewProvider {
    static var bgGradient = LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static var previews: some View {
        ControlButtonView(answerString: .constant(""), title: "delete", bgGradient: bgGradient, execute: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
