//
//  Popup.swift
//  War Card Game
//
//  Created by Andrija Eremić on 16.8.24..
//

import Foundation
import SwiftUI

public struct Popup<PopupContent> : ViewModifier where PopupContent : View {
	@Binding var isPresented: Bool
	
	var view: () -> PopupContent
	var onDismiss: () -> Void
	
	init(isPresented: Binding<Bool>, onDismiss: @escaping () -> Void, view: @escaping () -> PopupContent) {
		self._isPresented = isPresented
		self.onDismiss = onDismiss
		self.view = view
	}
	
	// MARK: - Private Properties
	
	/// The rect of the hosting controller
	@State private var presenterContentRect: CGRect = .zero
	
	/// The rect of popup content
	@State private var sheetContentRect: CGRect = .zero
	
	/// The offset when the popup is displayed
	private var displayedOffset: CGFloat {
		-presenterContentRect.midY + screenHeight/2
	}
	
	/// The offset when the popup is hidden
	private var hiddenOffset: CGFloat {
		if presenterContentRect.isEmpty {
			return 1000
		}
		return screenHeight - presenterContentRect.midY + sheetContentRect.height/2 + 5
	}
	
	/// The current offset, based on the "presented" property
	private var currentOffset: CGFloat {
		return isPresented ? displayedOffset : hiddenOffset
	}
	private var screenWidth: CGFloat {
		UIScreen.main.bounds.size.width
	}
	
	private var screenHeight: CGFloat {
		UIScreen.main.bounds.size.height
	}
	
	// MARK: - Content Builders
	
	public func body(content: Content) -> some View {
		ZStack {
			content
				.frameGetter($presenterContentRect)
		}
		.overlay(sheet())
	}
	
	func sheet() -> some View {
		ZStack {
			self.view()
				.simultaneousGesture(
					TapGesture().onEnded {
						dismiss()
					})
				.frameGetter($sheetContentRect)
				.frame(width: screenWidth)
				.offset(x: 0, y: currentOffset)
				.animation(Animation.easeOut(duration: 0.3), value: currentOffset)
		}
	}
	
	private func dismiss() {
		self.onDismiss()
		isPresented = false
	}
}
