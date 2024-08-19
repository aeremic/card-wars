//
//  StatsView.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import SwiftUI
import SwiftData

struct StatsView: View {
	@EnvironmentObject var router: Router
	
	@Environment(\.modelContext) var modelContext: ModelContext
	@Query(sort: \ScoreDataModel.score, order: .reverse) var scoreDataModel: [ScoreDataModel]
		
    var body: some View {
		ZStack {
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			VStack {
				List(scoreDataModel) { item in
					Text("Score \(String(item.score))")
				}
				.scrollContentBackground(.hidden)
				Spacer()
			}
		}
    }
}

#Preview {
    StatsView()
		.modelContainer(for: [ScoreDataModel.self], inMemory: true)
}
