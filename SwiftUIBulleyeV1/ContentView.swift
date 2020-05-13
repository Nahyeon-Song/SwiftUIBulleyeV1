//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by Release on 2020/05/13.
//  Copyright © 2020 Release. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    var body: some View {
        VStack{
            Text("Welcome to my first App!")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            // State for alert
                .alert(isPresented: self.$alertIsVisible){
                    Alert(title: Text("Hello there!"),
                          message: Text("This is my first pop-up."),
                          dismissButton: .default(Text("Awesome!")))
            }// End of .alert
        }// End of .VStack
    }// End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
