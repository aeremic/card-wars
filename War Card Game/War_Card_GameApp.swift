//
//  War_Card_GameApp.swift
//  War Card Game
//
//  Created by Andrija Eremić on 14.8.24..
//

import SwiftUI
import SwiftData

@main
struct War_Card_GameApp: App {
	@ObservedObject var router = Router()
	
    var body: some Scene {
        WindowGroup {
			NavigationStack(path: $router.navPath) {
				HomeView()
				.navigationDestination(for: Router.Destination.self) { dest in
					switch dest {
					case .game(let uuidAsString):
						GameContentView(uuidAsString: uuidAsString)
							.withCustomBackButton()
					case .stats:
						StatsView()
							.withCustomBackButton()
					}
				}
			}
			.environmentObject(router)
        }
		.modelContainer(for: [ScoreDataModel.self])
    }
}
