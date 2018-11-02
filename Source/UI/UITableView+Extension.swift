//
//  UITableView+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {

	func scrollToBottom(animated: Bool = true) {
		let sectionsCount = numberOfSections
		guard sectionsCount > 0 else {
			return
		}
		var lastNonEmptySection: Int = sectionsCount - 1
		while numberOfRows(inSection: lastNonEmptySection) == 0 && lastNonEmptySection > -1 {
			lastNonEmptySection -= 1
		}
		guard lastNonEmptySection > 0 else {
			return
		}
		let itemsCount = numberOfRows(inSection: lastNonEmptySection)
		guard itemsCount > 0 else {
			return
		}
		let lastItemIndex = IndexPath(row: itemsCount - 1, section: lastNonEmptySection)
		scrollToRow(at: lastItemIndex, at: .bottom, animated: animated)
	}
}
