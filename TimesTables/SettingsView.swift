//
//  SettingsView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var gameStarted: Bool
    @Binding var minimumTableValue: Int
    @Binding var maximumTableValue: Int
    @Binding var numberOfQuestions: Int
    
    var questionCountOptions: [Int]
    
    var body: some View {
        List {
            // minimum table value
            Section("Minimum table value") {
                Stepper("\(minimumTableValue)",value: $minimumTableValue, in: 2...12, step: 1) { _ in
                    if maximumTableValue < minimumTableValue {
                        maximumTableValue = minimumTableValue
                    } else {
                        maximumTableValue = maximumTableValue
                    } //if-else
                } //stepper
            } //section
            
            // maximum table value
            Section("Maximum table value") {
                Stepper("\(maximumTableValue)", value: $maximumTableValue, in: minimumTableValue...12, step: 1)
            } //section
            
            // number of questions
            Section("Number of questions") {
                Picker("Number of questions", selection: $numberOfQuestions) {
                    ForEach(questionCountOptions, id: \.self) {
                        Text("\($0)")
                    } //foreach
                } //picker
                .pickerStyle(.segmented)
            } //section
            
            // All user settings
            Section("Your settings") {
                SettingsRowView(title: "Minimum Value:", value: minimumTableValue)
                SettingsRowView(title: "Maximum Value:", value: maximumTableValue)
                SettingsRowView(title: "Number of Questions:", value: numberOfQuestions)
            } //section
            
            Section {
                HStack {
                    Spacer()
                    Button("START", action: { gameStarted = true })
                    Spacer()
                } //hstack
            } //section
        } //list
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            gameStarted: .constant(false),
            minimumTableValue: .constant(2),
            maximumTableValue: .constant(5),
            numberOfQuestions: .constant(10),
            questionCountOptions: [5, 10, 15, 20, 25]
        )
    }
}
