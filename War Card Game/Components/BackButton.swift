//
//  BackButton.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import Foundation
import SwiftUI

struct BackButton: View {
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Image(systemName: "arrow.backward.circle.fill")
		}
		.symbolVariant(.circle.fill)
		.foregroundColor(.white)
		.font(.title)
	}
}
