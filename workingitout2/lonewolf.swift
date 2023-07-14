//
//  lonewolf.swift
//  workinOut
//
//  Created by Zack Paulson on 7/2/23.
//
import Foundation
import SwiftUI
import AVKit
import AVFoundation

enum WorkoutType {
    case upperBody
    case abs
    case lowerBody
}

struct lonewolfView: View {
    @State private var completedSets = 0
    @State private var completedReps = 0
    @State private var isVideoPlaying = false
    @State private var player = AVPlayer()
    @State private var selectedWorkout: WorkoutType?

    var body: some View {
        VStack {
            Text("Lone Wolf Workout")
                .font(.title)
                .padding()

            Text("Sets: \(completedSets)")
                .font(.headline)
            Text("Reps: \(completedReps)")
                .font(.headline)

            HStack {
                workoutButton("Upper Body", type: .upperBody)
                workoutButton("Abs", type: .abs)
                workoutButton("Lower Body", type: .lowerBody)
            }

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
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .frame(height: 300) // Adjust the size of the video player view
            }
        }
        .onDisappear {
            player.pause()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarHidden(true)
    }

    private func workoutButton(_ title: String, type: WorkoutType) -> some View {
        Button(action: {
            selectedWorkout = type
            setupVideoPlayer(for: type)
        }) {
            Text(title)
                .font(.headline)
                .padding()
                .background(selectedWorkout == type ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    private func incrementSets() {
        completedSets += 1
        isVideoPlaying = true
        setupVideoPlayer(for: selectedWorkout)
        player.play()
    }

    private func incrementReps() {
        completedReps += 1
    }

    private func setupVideoPlayer(for workoutType: WorkoutType?) {
        guard let workoutType = workoutType else {
            return
        }

        var videoFileName = ""

        switch workoutType {
        case .upperBody:
            videoFileName = "upperbody"
        case .abs:
            videoFileName = "abs"
        case .lowerBody:
            videoFileName = "lowerbody"
        }

        guard let videoURL = Bundle.main.url(forResource: videoFileName, withExtension: "mov") else {
            completedReps = 99
            return
        }

        player = AVPlayer(url: videoURL)
    }
}

struct lonewolfView_Previews: PreviewProvider {
    static var previews: some View {
        lonewolfView()
    }
}
