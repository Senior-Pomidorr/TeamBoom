//
//  GameEndViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct GameEndView: View {
    // MARK: - States&Properties

    @ObservedObject var gameModel: GameViewModel

    // MARK: - UI

    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                if gameModel.withPunishment {
                    Text("Проигравший выполняет задание")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom(CustomFonts.DelaGothicOne, size: 24))
                } else {
                    Text("Время вышло!")
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.custom(CustomFonts.DelaGothicOne, size: 24))
                }
                Image("explosion")
                    .resizable()
                    .scaledToFit()
                if gameModel.withPunishment {
                    Text(gameModel.punishment)
                        .padding(8)
                        .foregroundColor(.violet)
                        .font(.custom(CustomFonts.DelaGothicOne, size: 20))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.7)
                       // .frame(width: .infinity, height: 120)
                }

                VStack(spacing: 15) {
                    if gameModel.withPunishment {
                        Button {
                            gameModel.getPunishment()
                        } label: {
                            Text("Другое задание")
                                .font(.custom(CustomFonts.DelaGothicOne, size: 22))
                                .frame(width: 274, height: 79)
                        }
                        .frame(width: 274, height: 79)
                        .background(.violet)
                        .foregroundColor(.yellowGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 5, y: 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(.black)
                        }
                    }
                    Button {
                        restartGame()
                    } label: {
                        Text("Начать заново")
                            .font(.custom(CustomFonts.DelaGothicOne, size: 22))
                    }
                    .frame(width: 274, height: 79)
                    .background(.violet)
                    .foregroundColor(.yellowGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(radius: 5, y: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.black)
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }
}

// MARK: - Methods

extension GameEndView {
    private func restartGame() {
        gameModel.isPlaying = false
        gameModel.isOver = false
        gameModel.isPaused = false
    }
}

// MARK: - Preview

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView(gameModel: GameViewModel())
    }
}
