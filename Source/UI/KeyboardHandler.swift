//
//  KeyboardHandler.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol KeyboardHandler {

	var bottomConstraint: NSLayoutConstraint { get }
	var offsetFromBottomWhenKeyboardIsVisible: CGFloat { get }
	var offsetFromBottomWhenKeyboardIsHidden: CGFloat { get }
	var shouldUpdateConstraint: Bool { get }

	func willShowKeyboard(rect: CGRect)
	func willHideKeyboard(rect: CGRect)
}

public extension KeyboardHandler {

	var offsetFromBottomWhenKeyboardIsVisible: CGFloat {
		return 0.0
	}
	var offsetFromBottomWhenKeyboardIsHidden: CGFloat {
		return 0.0
	}
	var shouldUpdateConstraint: Bool {
		return true
	}
	func willShowKeyboard(rect: CGRect) {}
	func willHideKeyboard(rect: CGRect) {}
}

public extension KeyboardHandler {

	func registerForKeyboardNotifications() {
		_ = NotificationCenter.default.addObserver(
			forName: UIResponder.keyboardWillShowNotification,
			object: nil,
			queue: nil) { (notification) in
				guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
					return
				}
				if self.shouldUpdateConstraint {
					let value = keyboardFrame.height - self.offsetFromBottomWhenKeyboardIsVisible
					self.bottomConstraint.constant = value
				}
				self.willShowKeyboard(rect: keyboardFrame)
		}
		_ = NotificationCenter.default.addObserver(
			forName: UIResponder.keyboardWillHideNotification,
			object: nil,
			queue: nil) { (notification) in
				guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
					return
				}
				if self.shouldUpdateConstraint {
					let value = self.offsetFromBottomWhenKeyboardIsHidden
					self.bottomConstraint.constant = value
				}
				self.willHideKeyboard(rect: keyboardFrame)
		}
	}

	func removeKeyboardNotifications() {
		NotificationCenter.default.removeObserver(
			self,
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)
		NotificationCenter.default.removeObserver(
			self,
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
	}
}
