//
//  Score.swift
//  War Card Game
//
//  Created by Andrija Eremić on 19.8.24..
//

import Foundation
import SwiftData

@Model
class ScoreDataModel {
	@Attribute(.unique) let id = UUID()
	let score: Int
	let createdOn: Date?
	
	init(score: Int, createdOn: Date?) {
		self.score = score
		self.createdOn = createdOn
	}
}
