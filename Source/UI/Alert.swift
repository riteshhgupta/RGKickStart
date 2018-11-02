//
//  AlertInfoProvider.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public protocol Alert {

	var alertTitle: String { get }
	var alertMessage: String { get }
	var alertActions: [UIAlertAction] { get }
}
