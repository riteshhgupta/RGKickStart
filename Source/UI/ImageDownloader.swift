//
//  ImageDownloader.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol ImageDownloader {

	func cachedImage(for url: URL) -> UIImage?
	func downloadImage(for url: URL, _ handler: @escaping (UIImage?) -> Void)
}
