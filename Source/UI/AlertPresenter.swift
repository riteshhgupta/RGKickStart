//
//  AlertPresenter.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import Result
import ReactiveSwift

public protocol AlertPresenter: class {

	var alertPresenter: UIViewController { get }
}

public extension Reactive where Base: AlertPresenter {

	var showAlert: BindingTarget<Alert> {
		return makeBindingTarget { (presenter, alert) in
			presenter.presentAlert(alert)
		}
	}
}

public extension AlertPresenter where Self: UIViewController {

	var alertPresenter: UIViewController {
		return self
	}
}

private extension AlertPresenter {

	func presentAlert(_ alertBuilder: Alert) {
		let alert = UIAlertController.Style.alert.controller(
			title: alertBuilder.alertTitle,
			message: alertBuilder.alertMessage,
			actions: alertBuilder.alertActions
		)
		DispatchQueue.main.async { self.alertPresenter.present(alert, animated: true) }
	}
}
