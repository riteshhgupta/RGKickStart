//
//  UIFont+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol FontIdentifier {

    var name: String { get }
    var size: CGFloat { get }
}

public extension UIFont {

    convenience init(_ identifier: FontIdentifier) {
        self.init(name: identifier.name, size: identifier.size)!
    }
}
