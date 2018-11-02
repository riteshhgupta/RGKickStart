//
//  LoaderPresenter.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift

public protocol LoaderPresenter: class {

	var loader: Loader { get }
}

public extension Reactive where Base: LoaderPresenter {

	var showLoader: BindingTarget<Bool> {
		return makeBindingTarget { (presenter, shouldShowLoader) in
			if shouldShowLoader {
				presenter.loader.showLoader()
			} else {
				presenter.loader.hideLoader()
			}
		}
	}
}
