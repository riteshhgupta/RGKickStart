//
//  URL+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public extension URL {

	var parameters: [String: Any]? {
		guard
			let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
			let queryItems = components.queryItems
			else
		{
			return nil
		}
		var parameters = [String: Any]()
		for item in queryItems {
			parameters[item.name] = item.value
		}
		return parameters
	}
}
