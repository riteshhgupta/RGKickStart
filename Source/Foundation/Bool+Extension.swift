//
//  Bool+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 05/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public extension Bool {

	mutating func toggle() {
		self = toggled()
	}

	func toggled() -> Bool {
		return !self
	}
}
