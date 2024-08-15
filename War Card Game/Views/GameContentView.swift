//
//  ContentView.swift
//  War Card Game
//
//  Created by Andrija Eremić on 14.8.24..
//

import SwiftUI

struct GameContentView: View {
	@EnvironmentObject var router: Router
	
	@State var playerCard = "card7"
	@State var cpuCard = "card13"
	
	@State var playerScore: Int = 0
	@State var cpuScore: Int = 0
	
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
	
    var body: some View {
		ZStack {
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			VStack {
				Image("logo")
					.padding(.bottom, 40.0)
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
			}
			.padding()
		}
    }
}

#Preview {
	GameContentView()
}
