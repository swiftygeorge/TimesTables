//
//  NumberButtonView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct NumberButtonView: View {
    @Binding var answerString: Int
    
    var imageName: String
    var digit: String
    var color: Color
    
    var body: some View {
        Button {
           // do something
        } label: {
            HStack(alignment: .center, spacing: 5) {
                Text(digit)
                    .font(.largeTitle.bold())
                    .foregroundColor(color)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .shadow(radius: 2)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(color)
                    }
            } // vstack
            .padding(8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(minWidth: 100)
            .shadow(radius: 1)
        } //button
    }
}

struct NumberButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumberButtonView(answerString: .constant(0), imageName: "horse", digit: "3", color: .green)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
