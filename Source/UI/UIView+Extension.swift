//
//  UIView+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 05/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

	func addAndFitSubview(_ view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		view.frame = self.bounds
		addSubview(view)
		let views = ["view": view]
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: views))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: views))
	}

	func snapshot() -> UIImage? {
		let imageRenderer = UIGraphicsImageRenderer(bounds: bounds)
		return imageRenderer.image { layer.render(in: $0.cgContext) }
	}

	func findParentView<T: UIView>(ofType type: T.Type) -> T? {
		var superview = self.superview
		while (superview?.superview as? T) == nil { superview = superview?.superview }
		return superview?.superview as? T
	}
}
