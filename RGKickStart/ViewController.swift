//
//  ViewController.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import Result
import Nuke
import ReactiveSwift

class ViewController: UIViewController, AlertPresenter {

	@IBOutlet var label: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		label.attributedText = "Ritesh".attributedString(with: [
			"Rit".with(attributes: [.textColor(.red)]),
			"esh".with(attributes: [.textColor(.blue)])
			]
		)
	}
}

class DownloadableImageView: UIImageView, ImageDownloadableContainer {

	func set(image: UIImage?) {
		self.image = image
	}
}

class DownloadableButton: UIButton, ImageDownloadableContainer {

	func set(image: UIImage?) {
		setImage(image, for: .normal)
	}
}
