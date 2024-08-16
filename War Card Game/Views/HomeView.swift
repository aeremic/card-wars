//
//  InitialView.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import Foundation
import SwiftUI

struct HomeView: View {
	@EnvironmentObject var router: Router
	
	func onPlayClick() {
		router.navigate(to: .game(uuidAsString: "uuidTesting"))
	}
	
	func onGoToStatsClick() {
		router.navigate(to: .stats)
	}
	
	var body: some View {
		VStack {
			ZStack {
				Image("background-plain")
					.resizable()
					.ignoresSafeArea()
				VStack {
					Image("logo")
						.padding(.bottom, 40.0)
					HStack {
						Spacer()
						Button("Play") {
							self.onPlayClick()
						}
						.padding()
						.background(.white, in: RoundedRectangle(cornerRadius: 20))
						.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
						Button("Statistics") {
							self.onGoToStatsClick()
						}
						.padding()
						.background(.white, in: RoundedRectangle(cornerRadius: 20))
						.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
						Spacer()
					}
					.foregroundColor(.green)
					.font(.title)
					.padding()
				}
			}
		}
	}
}

#Preview {
	HomeView()
}
