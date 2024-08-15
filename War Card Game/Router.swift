//
//  Router.swift
//  War Card Game
//
//  Created by Andrija Eremić on 15.8.24..
//

import Foundation
import SwiftUI

final class Router : ObservableObject {
	@Published var navPath = NavigationPath()

	public enum Destination: Codable, Hashable {
		case game(uuidAsString: String)
		case stats
	}
	
	func navigate(to destination: Destination) {
		navPath.append(destination)
	}
	
	func navigateBack() {
		navPath.removeLast()
	}
	
	func navigateToRoot() {
		navPath.removeLast(navPath.count)
	}
}
