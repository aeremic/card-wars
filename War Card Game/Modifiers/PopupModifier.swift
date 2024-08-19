//
//  Popup.swift
//  War Card Game
//
//  Created by Andrija Eremić on 16.8.24..
//

import Foundation
import SwiftUI

extension View {
	public func popup<PopupContent: View> (
		isPresented: Binding<Bool>,
		onDismiss: @escaping () -> Void,
		view: @escaping () -> PopupContent) -> some View {
			self.modifier (
				Popup (
					isPresented: isPresented,
					onDismiss: onDismiss,
					view: view)
			)
	}
}
