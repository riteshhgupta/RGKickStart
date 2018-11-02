//
//  NibDesignable.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ProtoKit

public protocol NibDesignable: Describable {

	var nibName: String { get }
	var nibContainerView: UIView { get }

	func loadNib() -> UIView
}

public extension NibDesignable where Self: UIView {

	var nibContainerView: UIView { return self }

	var nibName: String { return typeName }

	func loadNib() -> UIView {
		return Bundle(for: Self.self)
			.loadNibNamed(nibName, owner: self, options: nil)?
			.first
			as! UIView
	}

	func setupNibDesignableView() {
		nibContainerView.addAndFitSubview(loadNib())
	}
}
