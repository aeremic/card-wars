//
//  StatsView.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import SwiftUI

struct StatsView: View {
	@EnvironmentObject var router: Router
	let listData = ["Points 13", "Points 14", "Points 15"]
	
    var body: some View {
		ZStack {
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			VStack {
				List(listData, id: \.self) { item in
					Text(item)
				}
				.scrollContentBackground(.hidden)
				Spacer()
			}
		}
    }
}

#Preview {
    StatsView()
}
