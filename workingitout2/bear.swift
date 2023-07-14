//
//  bear.swift
//  workinOut
//
//  Created by Zack Paulson on 7/2/23.
//

import Foundation
import SwiftUI
import AVKit
import AVFoundation

struct bearView: View {
    @State private var completedSets = 0
    @State private var completedReps = 0
    @State private var isVideoPlaying = false
    @State private var player = AVPlayer()

    var body: some View {
        VStack {
            Text("Bear Workout")
                .font(.title)
                .padding()

            Text("Sets: \(completedSets)")
                .font(.headline)
            Text("Reps: \(completedReps)")
                .font(.headline)

            Button(action: {
                incrementSets()
            }) {
                Text("Complete Set")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                incrementReps()
            }) {
                Text("Complete Rep")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if isVideoPlaying {
                VideoPlayer(player: player)
                    .onAppear {
                        setupVideoPlayer()
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
            }
        }
        .onDisappear {
            player.pause()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true)
    }

    private func incrementSets() {
        completedSets += 1
        isVideoPlaying = true
        player.play()
    }

    private func incrementReps() {
        completedReps += 1
    }

    private func setupVideoPlayer() {
        guard let videoURL = Bundle.main.url(forResource: "ronnie", withExtension: "MOV") else {
            return
        }
        player = AVPlayer(url: videoURL)
    }
}

struct bearView_Previews: PreviewProvider {
    static var previews: some View {
        bearView()
    }
}
