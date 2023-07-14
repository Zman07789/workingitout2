
//  ContentView.swift
//  workinOut
//
//  Created by Zack Paulson on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Color.black
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    ZStack {
                        VStack {
                            Image("homepic")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350, height: 350)
                                .cornerRadius(20)
                            
                            Text("Welcome, my brother! Click on the button to become an absolute unit.")
                                .italic()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: BeastChooserView()) {
                                Text("Choose Your Plan")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                )
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
