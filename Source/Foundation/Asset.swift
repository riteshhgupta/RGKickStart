//
//  Asset.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

// not used anywhere as of now
public protocol Asset {

	associatedtype Identifier

	static func asset(_ identifier: Identifier) -> Self
}
