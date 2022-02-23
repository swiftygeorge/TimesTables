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
    @State private var gameOver = false
    @State private var minimumTableValue = 2
    @State private var maximumTableValue = 5
    @State private var numberOfQuestions = 10
    @State private var answer = 0
    @State private var answerString = ""
    @State private var score = 0
    
    @State private var factorA = 0
    @State private var factorB = 0
    @State private var correctAnswer = 0
    
    var deleteButtonBG: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color("Radical Red"), Color("Orange Soda")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var submitButtonBG: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color("Medium Aquamarine"), Color("Emerald")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationView {
            if gameStarted {
                VStack(alignment: .center, spacing: 30) {
                    VStack(spacing: 10) {
                        Text("What's".uppercased())
                            .font(.title.weight(.medium))
                            .foregroundColor(.secondary)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "\(factorA).square")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 70))
                            
                            Text("x")
                            Image(systemName: "\(factorB).square")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 70))
                        } //hstack
                        .font(.largeTitle.bold())
                    } //vstack
                    
                    Text(answerString)
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
                            NumberButtonView(answerString: $answerString, imageName: "cow", digit: "1", color: .red)
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "duck", digit: "2", color: .blue)
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "horse", digit: "3", color: .green)
                            Spacer()
                            Spacer()
                        } //hstack
                        
                        HStack {
                            Spacer()
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "dog", digit: "4", color: .yellow)
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "goat", digit: "5", color: .purple)
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "pig", digit: "6", color: .mint)
                            Spacer()
                            Spacer()
                        } //hstack
                        
                        HStack {
                            Spacer()
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "giraffe", digit: "7", color: .yellow)
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "narwhal", digit: "8", color: .purple)
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "parrot", digit: "9", color: .mint)
                            Spacer()
                            Spacer()
                        } //hstack
                        
                        HStack {
                            Spacer()
                            Spacer()
                            ControlButtonView(answerString: $answerString, title: "Delete", bgGradient: deleteButtonBG) {
                                if !answerString.isEmpty {
                                    answerString.removeLast()
                                } //if
                            } //controlbuttonview
                            Spacer()
                            NumberButtonView(answerString: $answerString, imageName: "snake", digit: "0", color: .orange)
                            Spacer()
                            ControlButtonView(answerString: $answerString, title: "Submit", bgGradient: submitButtonBG) {
                                if !answerString.isEmpty {
                                    answer = Int(answerString) ?? 0
                                } //if
                                
                                if numberOfQuestions > 1 {
                                    nextQuestion()
                                } else {
                                    score += 1
                                    gameOver = true
                                    answerString = ""
                                } //if
                            } //controlbuttonview
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
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Score: \(score)")
                            .font(.headline.bold())
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background(.thickMaterial)
                            .cornerRadius(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10).stroke()
                            }
                    } //toolbaritem
                } //toolbar
                .onAppear {
                    generateFactors()
                } //onappear
                .alert("Game Over!", isPresented: $gameOver) {
                    Button("Cancel", role: .cancel) {
                        gameStarted = false
                        numberOfQuestions = 10
                    } //button
                    Button("Play Again") {
                        restartGame()
                    } //button
                } message: {
                    Text("Your final score is \(score)")
                } //alert
            } else {
                SettingsView(
                    gameStarted: $gameStarted,
                    minimumTableValue: $minimumTableValue,
                    maximumTableValue: $maximumTableValue,
                    numberOfQuestions: $numberOfQuestions,
                    score: $score,
                    questionCountOptions: questionCountOptions
                )
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            } //if-else
        } //nav
    }
    
    func generateFactors() {
        factorA = Int.random(in: minimumTableValue...maximumTableValue)
        factorB = Int.random(in: 1...10)
        correctAnswer = factorA * factorB
    }
    
    func nextQuestion() {
        // check if answer is correct
        if answer == correctAnswer {
            score += 1
        } //if
        
        // generate new factors
        generateFactors()
        // reset variables
        answerString = ""
        numberOfQuestions -= 1
    }
    
    func restartGame() {
        generateFactors()
        answerString = ""
        score = 0
        numberOfQuestions = 10
        gameStarted = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
