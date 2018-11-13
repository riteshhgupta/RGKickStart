//
//  Nuke+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import Nuke

extension ImagePipeline: ImageDownloader {

    public func cachedImage(for url: URL) -> UIImage? {
        let request = ImageRequest(url: url)
		return ImageCache.shared[request]
	}

	public func downloadImage(for url: URL, _ handler: @escaping (UIImage?) -> Void) {
		let nukeRequest = ImageRequest(url: url)
        ImagePipeline.shared.loadImage(with: nukeRequest) { (response, _) in
            handler(response?.image)
        }
	}
}
