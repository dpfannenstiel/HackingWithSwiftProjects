//
//  ContentView.swift
//  Shared
//
//  Created by Dustin Pfannenstiel on 3/6/22.
//

import SwiftUI

enum Option: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissor = "Scissor"

    static let all: [Option] = [.rock, .paper, .scissor]

    static let model: [Option: Option] = [
        .rock: .scissor,
        .scissor: .paper,
        .paper: .rock
    ]

    var icon: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📃"
        case .scissor:
            return "✂️"
        }
    }
}

struct OptionView: View {
    let option: Option

    var body: some View {
        HStack {
            Text(option.icon)
            Text(option.rawValue)
        }
    }

    init(_ option: Option) {
        self.option = option
    }
}

struct HighlightBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
    }
}

extension View {
    func highlight() -> some View {
        modifier(HighlightBox())
    }
}

struct ContentView: View {
    let options = Option.all

    @State private var choice = Int.random(in: 0...2)
    @State private var playerWins = Bool.random()
    @State private var score = 0
    @State private var count = 0
    @State private var showAlert = false
    var option: Option {
        options[choice]
    }

    var font: Font {
        Font.title3.lowercaseSmallCaps()
    }

    @ViewBuilder var background: some View {
        Color.red
            .ignoresSafeArea()
    }

    var body: some View {
        ZStack{
            background
            VStack {
                HStack {
                    Text("Player's Score:")
                    Text("\(score)")
                }
                .font(font)
                .highlight()
                Spacer()
                VStack {
                    Text("App Chooses:")
                    OptionView(option)
                }
                .font(font)
                .highlight()
                Spacer()
                VStack {
                    VStack {
                        Text("Player should")
                        if playerWins {
                            Text("Win!")
                        } else {
                            Text("Lose")
                        }
                    }
                    .font(font)
                    VStack(spacing: 20) {
                        ForEach(options, id: \.self) { option in
                            Button {
                                score(option)
                            } label: {
                                Text(option.icon)
                                    .font(.system(size: 100))
                                    .accessibilityLabel(option.rawValue)
                            }
                        }
                    }
                }
                .highlight()
                Spacer()
            }
        }
        .alert("Game Over", isPresented: $showAlert) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Final Score: \(score) of \(count)")
        }
    }

    func score(_ player: Option) {
        let playerWon = playerWins ? playerWins(player) : playerLoses(player)
        score += playerWon ? 1 : 0
        count += 1
        if count >= 8 {
            showAlert = true
        }
        playerWins.toggle()
        choice = Int.random(in: 0...2)
    }

    private func playerLoses(_ player: Option) -> Bool {
        Option
            .model
            .first { $0.key == option }
            .map { $0.value == player } ?? false
    }

    private func playerWins(_ player: Option) -> Bool {
        Option
            .model
            .reduce(into: [:]) { partialResult, pair in
                partialResult[pair.value] = pair.key
            }
            .first { $0.key == option }
            .map { $0.value == player } ?? false
    }

    func resetGame() {
        score = 0
        count = 0
        choice = Int.random(in: 0...2)
        playerWins = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.layoutDirection, .leftToRight)
                .previewDisplayName("Left to Right")

            ContentView()
                .environment(\.layoutDirection, .rightToLeft)
                .previewDisplayName("Right To Left")
        }
    }
}
