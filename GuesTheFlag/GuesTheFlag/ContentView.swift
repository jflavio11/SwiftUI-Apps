//
//  ContentView.swift
//  GuesTheFlag
//
//  Created by Jose Flavio Quispe on 27/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var currentScore = 0
    @State private var showScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Select the correct answer:")
                        .font(.title)
                    Text("\(countries[correctAnswer])")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.foregroundColor(.white)
                .padding(.top, 20)
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        onFlagTapped(number)
                    }, label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    })
                }
                
                Spacer()
            }
            .alert(isPresented: $showScore, content: {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(currentScore)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            })
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
    }
    
    func onFlagTapped(_ flagNumber: Int) {
        if flagNumber == correctAnswer {
            scoreTitle = "Correc!"
            currentScore += 1
        } else {
            scoreTitle = "Incorrect uwu That's the flag of \(countries[flagNumber])"
        }
        showScore = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
