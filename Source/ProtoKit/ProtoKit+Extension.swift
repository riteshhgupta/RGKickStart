//
//  ProtoKit+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import ProtoKit

public extension ListableView {

	func register<Cell: Nibable & Describable>(_ cellType: Cell.Type) {
		registerItem(
			with: cellType.nib,
			for: cellType.typeName
		)
	}
}
