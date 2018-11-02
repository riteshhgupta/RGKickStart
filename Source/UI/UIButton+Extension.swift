//
//  UIButton+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 05/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit
import Result
import ReactiveSwift

public extension Reactive where Base: UIButton {

	var didTapSignal: Signal<Void, NoError> {
		return controlEvents(.touchUpInside)
			.toVoid()
	}
}
