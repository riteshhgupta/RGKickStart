//
//  NibDesignableView.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 05/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class NibDesignableView: UIView, NibDesignable {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupNibDesignableView()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupNibDesignableView()
	}
}
