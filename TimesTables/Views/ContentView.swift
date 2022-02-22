//
//  ContentView.swift
//  TimesTables
//
//  Created by George Mapaya on 2022-02-22.
//

import SwiftUI

struct ContentView: View {
    var questionCountOptions = [5, 10, 15, 20, 25]
    
    @State private var gameStarted = true
    @State private var minimumTableValue = 2
    @State private var maximumTableValue = 5
    @State private var numberOfQuestions = 10
    @State private var answer = 0
    @State private var answerString = ""
    
    var deleteButtonBG: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color("Radical Red"), Color("Orange Soda")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var submitButtonBG: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color("Medium Aquamarine"), Color("Emerald")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationView {
            if gameStarted {
                VStack(alignment: .center, spacing: 30) {
                    VStack(spacing: 10) {
                        Text("What's")
                            .font(.title.weight(.medium))
                            .foregroundColor(.secondary)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "5.square")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 70))
                            
                            Text("x")
                            Image(systemName: "9.square")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 70))
                        } //hstack
                        .font(.largeTitle.bold())
                    } //vstack
                    
                    Text("")
                        .font(.largeTitle.bold())
                        .foregroundColor(.secondary)
                        .tracking(2)
                        .padding()
                        .frame(minWidth: 150, minHeight: 80)
                        .background(.ultraThinMaterial)
                        .cornerRadius(5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5).stroke(.secondary)
                        }
                    
                    VStack(spacing: 10) {
                        HStack(alignment: .center) {
                            Spacer()
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "cow", digit: "1", color: .red)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "duck", digit: "2", color: .blue)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "horse", digit: "3", color: .green)
                            Spacer()
                            Spacer()
                        } //hstack
                        
                        HStack {
                            Spacer()
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "dog", digit: "4", color: .yellow)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "goat", digit: "5", color: .purple)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "pig", digit: "6", color: .mint)
                            Spacer()
                            Spacer()
                        } //hstack
                        
                        HStack {
                            Spacer()
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "giraffe", digit: "7", color: .yellow)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "narwhal", digit: "8", color: .purple)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "parrot", digit: "9", color: .mint)
                            Spacer()
                            Spacer()
                        } //hstack
                        
                        HStack {
                            Spacer()
                            Spacer()
                            ControlButtonView(title: "Delete", bgGradient: deleteButtonBG)
                            Spacer()
                            NumberButtonView(answerString: $answer, imageName: "snake", digit: "0", color: .orange)
                            Spacer()
                            ControlButtonView(title: "Submit", bgGradient: submitButtonBG)
                            Spacer()
                            Spacer()
                        } //hstack
                    } //vstack
                } //vstack
                .padding(20)
                .navigationTitle("Time Tables")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            gameStarted = false
                        } label: {
                            Image(systemName: "gearshape")
                        } //button
                    } //toolbaritem
                } //toolbar
            } else {
                SettingsView(
                    gameStarted: $gameStarted,
                    minimumTableValue: $minimumTableValue,
                    maximumTableValue: $maximumTableValue,
                    numberOfQuestions: $numberOfQuestions,
                    questionCountOptions: questionCountOptions
                )
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            } //if-else
        } //nav
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
