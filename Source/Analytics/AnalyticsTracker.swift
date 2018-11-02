//
//  AnalyticsTracker.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import ReactiveSwift

public protocol AnalyticsTracker: class {

	var analytics: Analytics { get }
}

public extension Reactive where Base: AnalyticsTracker {

	var track: BindingTarget<AnalyticsEvent> {
		return makeBindingTarget { tracker, event in
			tracker.analytics.track(event: event)
		}
	}
}
