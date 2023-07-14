//
//  beastchoser.swift
//  workinOut
//
//  Created by Zack Paulson on 7/2/23.
//
import SwiftUI

struct BeastChooserView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set the background color to black
            
            VStack(spacing: 20) {
                Text("Choose Your Beast")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                NavigationLink(destination: lonewolfView()) {
                    ButtonView(text: "Lone Wolf")
                }
                
                NavigationLink(destination: lionView()) {
                    ButtonView(text: "Lion")
                }
                
                NavigationLink(destination: bearView()) {
                    ButtonView(text: "Bear")
                }
                
                NavigationLink(destination: RonnieColemanView()) {
                    ButtonView(text: "Ronnie Coleman")
                }
            }
            .padding()
        }
    }
}

struct ButtonView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.gray)
            .cornerRadius(10)
    }
}

struct BeastChooserView_Previews: PreviewProvider {
    static var previews: some View {
        BeastChooserView()
    }
}
