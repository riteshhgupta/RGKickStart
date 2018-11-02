//
//  AnyError+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import Result

extension AnyError: Alert {

	public var alertTitle: String {
		return alert?.alertTitle ?? "AnyError"
	}

    public var alertMessage: String {
		return alert?.alertMessage ?? "AnyError's internal `error` doesn't conform to AlertInfoProvider"
	}

	public var alertActions: [UIAlertAction] {
		return ["Ok".action()]
	}
}

private extension AnyError {

	var alert: Alert? {
		return error as? Alert
	}
}
