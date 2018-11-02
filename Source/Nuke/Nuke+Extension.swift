//
//  Nuke+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import Nuke

extension Manager: ImageDownloader {

    public func cachedImage(for url: URL) -> UIImage? {
		return cache?[Request(url: url)]
	}

	public func downloadImage(for url: URL, _ handler: @escaping (UIImage?) -> Void) {
		let nukeRequest = Request(url: url)
		loadImage(with: nukeRequest) { (result) in
			handler(result.value)
		}
	}
}
