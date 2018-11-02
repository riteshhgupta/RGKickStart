//
//  AnalyticsEvent.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 03/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol AnalyticsEvent {

    var value: [String: Any] { get }
}
