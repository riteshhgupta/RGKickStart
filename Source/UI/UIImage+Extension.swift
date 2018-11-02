//
//  UIImage+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol ImageIdentifier {

    var name: String { get }
}

public extension UIImage {

    convenience init(_ identifier: ImageIdentifier) {
        self.init(named: identifier.name)!
    }
}

