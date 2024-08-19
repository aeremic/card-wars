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
		
	func onDeleteScore (at offsets: IndexSet) {
		print(offsets)
	}
	
    var body: some View {
		ZStack {
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			VStack {
				List {
					ForEach(scoreDataModel) { item in
						Text("Score \(String(item.score))")
						.swipeActions(edge: .trailing) {
							Button(role: .destructive) {
								modelContext.delete(item)
								do {
									try modelContext.save()
								} catch {
									print(error.localizedDescription)
								}
							} label: {
								Label("Delete", systemImage: "trash")
							}
						}
					}
					// .onDelete(perform: onDeleteScore)
				}
				.scrollContentBackground(.hidden)
			}
		}
    }
}

#Preview {
    StatsView()
		.modelContainer(for: [ScoreDataModel.self], inMemory: true)
}
