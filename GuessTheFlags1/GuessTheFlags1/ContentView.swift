//
//  ContentView.swift
//  GuessTheFlags1
//
//  Created by ihlas on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
 
    @State private var countires = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Polan", "Russia", "Spain", "UK", "USA"].shuffled()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var correctAnswer = Int.random(in: 0...3)

  
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
     
            VStack(spacing: 50){
                
            VStack{
                Text("Tap the flag of")
                    .foregroundColor(.black)
                
                Text(countires[correctAnswer])
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
            }
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
             //       }label:{
                    }){
                        Image(self.countires[number])
                       .renderingMode(.original)
                       .clipShape(Capsule())
                       .overlay(Capsule().stroke(.black, lineWidth: 10))
                       .shadow(radius: 10)
                    }
                    
                }
                VStack(spacing: 150){
                    Text("Total score: \(score)")
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Contiune")){
                self.askQuestion()
                
            })
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 5
            
        }else{
            scoreTitle = "Wrong that is the flag of \(countires[number])"
            score -= 3
        }
        showingScore = true
            
        }
        func askQuestion() {
            countires.shuffle()
            correctAnswer = Int.random(in: 0 ... 3)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

