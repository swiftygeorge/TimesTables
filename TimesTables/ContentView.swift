//
//  ContentView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct ContentView: View {
    var questionCountOptions = [5, 10, 15, 20, 25]
    
    @State private var gameStarted = false
    @State private var minimumTableValue = 2
    @State private var maximumTableValue = 5
    @State private var numberOfQuestions = 10
    
    var body: some View {
        NavigationView {
            if gameStarted {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    
                    Text("Let's Go!")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                } //zstack
                .navigationTitle("Time Tables")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                SettingsView(
                    gameStarted: $gameStarted,
                    minimumTableValue: $minimumTableValue,
                    maximumTableValue: $maximumTableValue,
                    numberOfQuestions: $numberOfQuestions,
                    questionCountOptions: questionCountOptions
                )
                .navigationTitle("Settings")
            } //if-else
        } //nav
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
