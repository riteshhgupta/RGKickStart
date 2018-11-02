//
//  DownloadableImagePresenter.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import Result
import ReactiveSwift

public protocol ImageDownloadableContainer: class {

	func set(image: UIImage?)
}

public extension Reactive where Base: (ImageDownloadableContainer & ReactiveExtensionsProvider) {

	var request: BindingTarget<ImageDownloadRequest> {
		return makeBindingTarget { imageView, request in
			imageView.reactive.setImage <~ request.image
		}
	}
}

public extension Reactive where Base: (ImageDownloadableContainer & ReactiveExtensionsProvider) {

	var setImage: BindingTarget<UIImage?> {
		return makeBindingTarget { imageProvider, image in
			imageProvider.set(image: image)
		}
	}
}
