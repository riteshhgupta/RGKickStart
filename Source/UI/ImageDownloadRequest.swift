//
//  DownloadImageRequest.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import Result

public protocol ImageDownloadRequest {

	var url: URL { get }
	var downloader: ImageDownloader { get }
	var placeholderImage: UIImage? { get }
	var image: SignalProducer<UIImage?, NoError> { get }
}

public extension ImageDownloadRequest {

	var image: SignalProducer<UIImage?, NoError> {
		return SignalProducer { (observer, _) in
			if let cachedImage = self.downloader.cachedImage(for: self.url) {
				observer.send(value: cachedImage)
			} else {
				observer.send(value: self.placeholderImage)
				self.downloader.downloadImage(for: self.url, {
					observer.send(value: $0)
				})
			}
		}
	}
}
