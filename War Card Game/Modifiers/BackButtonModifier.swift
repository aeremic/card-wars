//
//  BackButtonModifier.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import Foundation
import SwiftUI

struct BackButtonModifier: ViewModifier {
	@EnvironmentObject var router: Router
	
	func body(content: Content) -> some View {
		content
			.navigationBarBackButtonHidden(true)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					BackButton {
						router.navigateBack()
					}
				}
			}
	}
}

extension View {
	func withCustomBackButton() -> some View {
		modifier(BackButtonModifier())
	}
}
