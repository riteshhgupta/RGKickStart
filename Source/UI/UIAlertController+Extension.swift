//
//  UIAlertController+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public extension UIAlertController.Style {

	func controller(title: String? = nil, message: String? = nil, actions: [UIAlertAction]) -> UIAlertController {
		let controller = UIAlertController(
			title: title,
			message: message,
			preferredStyle: self
		)
		actions.forEach { controller.addAction($0) }
		return controller
	}
}

public extension UIAlertAction.Style {

	func action(title: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
		return UIAlertAction(
			title: title,
			style: self,
			handler: handler
		)
	}
}

public extension String {

	func action(
		style: UIAlertAction.Style = .default,
		handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
		return style.action(title: self, handler: handler)
	}
}
