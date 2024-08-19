//
//  ContentView.swift
//  War Card Game
//
//  Created by Andrija Eremić on 14.8.24..
//

import SwiftUI
import SwiftData

struct GameContentView: View {
	@EnvironmentObject var router: Router
	
	@Environment(\.modelContext) var modelContext: ModelContext
	@Query var scoreDataModel: [ScoreDataModel]
	
	var uuidAsString: String
	
	@State var showingPopup = false
	
	@State var playerCard = "card7"
	@State var cpuCard = "card13"
	
	@State var playerScore: Int = 0
	@State var cpuScore: Int = 0
	
	@State var playerResult: Int = 0
	
	func onDealClick () {
		let playerCardRandomizedValue = Int.random(in: 2...14)
		let cpuCardRandomizedValue = Int.random(in: 5...14)
		
		playerCard = "card" + String(playerCardRandomizedValue)
		cpuCard = "card" + String(cpuCardRandomizedValue)
		
		if playerCardRandomizedValue > cpuCardRandomizedValue {
			playerScore += 1
		} else if cpuCardRandomizedValue > playerCardRandomizedValue {
			cpuScore += 1
		}
	}
	
	func onFinishClick () {
		playerResult = playerScore - cpuScore
		
		let newDataToAdd = ScoreDataModel (
			score: playerResult,
			createdOn: nil
		)
		modelContext.insert(newDataToAdd)
		
		showingPopup = true
	}
	
	func onResetScores () {
		playerScore = 0
		cpuScore = 0
	}
	
    var body: some View {
		ZStack {
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			VStack {
				// Text("\(uuidAsString)")
				Image("logo")
					.padding(.bottom, 20.0)
				HStack {
					Spacer()
					Image(self.playerCard)
					Spacer()
					Image(self.cpuCard)
					Spacer()
				}
				.padding()
				Button {
					self.onDealClick()
				} label : {
					Image("button")
				}
				.padding(.bottom, 30.0)
				HStack {
					Spacer()
					VStack {
						Text("Player")
							.font(.title2)
							.padding(.bottom) // default 20
						Text(String(self.playerScore))
							.font(.title)
					}
					.foregroundColor(.white)
					Spacer()
					VStack {
						Text("CPU")
							.font(.title2)
							.padding(.bottom) // default 20
						Text(String(self.cpuScore))
							.font(.title)
					}
					.foregroundColor(.white)
					Spacer()
				}
				Spacer()
				Button("Finish") {
					self.onFinishClick()
				}
				.padding()
				.background(.white, in: RoundedRectangle(cornerRadius: 20))
				.foregroundColor(.green)
				.font(.title)
				.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
			}
			.padding()
		}
		.popup(isPresented: self.$showingPopup, onDismiss: self.onResetScores) {
			ZStack {
				Color.white.frame(width: 350, height: 150)
					.cornerRadius(10)
					.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
				VStack {
					Text("Achieved score: \(String(playerResult))")
						.foregroundColor(.green)
						.font(.title)
					.padding()
				}
			}
		}
    }
}

#Preview {
	GameContentView(uuidAsString: "testpreview")
		.modelContainer(for: [ScoreDataModel.self], inMemory: true)
}
