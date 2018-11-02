//
//  SVProgressHUD+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import SVProgressHUD

extension SVProgressHUD: Loader {

	public func showLoader() {
		SVProgressHUD.show()
	}

	public func hideLoader() {
		SVProgressHUD.dismiss()
	}
}

public extension LoaderPresenter {

	var loader: Loader {
		// making a new instance everytime is fine since `show()` & `dismiss()` methods are singleton methods
		// so it doesn't make a difference but it's necessary for polymorphism to work
		return SVProgressHUD()
	}
}
