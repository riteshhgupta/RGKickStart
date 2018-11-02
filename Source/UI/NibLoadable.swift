//
//  NibLoadable.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

public protocol NibLoadable: Describable, NSObjectProtocol {

	static var nibName: String { get }
	static func loadNib() -> Self
}

public extension NibLoadable where Self: UIView {

	static var nibName: String {
		return typeName
	}

	static func loadNib() -> Self {
		return Bundle(for: self)
			.loadNibNamed(nibName, owner: self, options: nil)?
			.first
			as! Self
	}
}
