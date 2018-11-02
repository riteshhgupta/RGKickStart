//
//  UIColor+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol ColorIdentifier {

    var name: String { get }
}

public extension UIColor {

    convenience init(_ identifier: ColorIdentifier) {
        self.init(named: identifier.name)!
    }
}
