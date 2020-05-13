//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by Release on 2020/05/13.
//  Copyright © 2020 Release. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Properties
    // ==========
    // state for User interface views
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    var sliderValueRounded: Int{
        Int(self.sliderValue.rounded())
    }
    // User interface content and layout
    var body: some View {
        VStack{
            Spacer()
            // Target row
            HStack{
                Text("Put the bullseye as close as you can to:")
                //Text("100")
                Text("\(self.target)")
            }
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // Button row
            Button(action: {
                //print("Button pressed!")
                print("points awarded: \(self.pointsForCurrentRound())")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            // State for alert
                .alert(isPresented: self.$alertIsVisible){
                    Alert(title: Text("Hello there!"),
                          message: Text(self.scoringMessage()),
                          dismissButton: .default(Text("Awesome!")))
            }// End of .alert
            Spacer()
            // Score row
            // TODO: Add views for the score, rounds, and start and info buttons here
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Inform")
                }
            }.padding(.bottom, 20)
        }// End of .VStack
    }// End of body
    // Methods
    // =======
    func pointsForCurrentRound() -> Int{
        let sliderValueRounded = Int(self.sliderValue.rounded())
        let difference: Int
        
        if sliderValueRounded > self.target{
            difference = sliderValueRounded - self.target
        }
        else if self.target > sliderValueRounded{
            difference = self.target - sliderValueRounded
        }
        else{
            difference = 0
        }
        return 100 - difference
    }
    
    func scoringMessage() -> String{
        return "The slider's value is \(self.sliderValueRounded).\n" +
        "The target value is \(self.target).\n" +
        "You scored \(self.pointsForCurrentRound()) points this round."
    }
}// End of struct


// Preview
// =======
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
