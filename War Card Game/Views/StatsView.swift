//
//  StatsView.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import SwiftUI

struct StatsView: View {
	@EnvironmentObject var router: Router
    var body: some View {
		ZStack {
			Image("background-plain")
				.resizable()
				.ignoresSafeArea()
			VStack {
				Text("Stats View")
			}
		}
    }
}

#Preview {
    StatsView()
}
