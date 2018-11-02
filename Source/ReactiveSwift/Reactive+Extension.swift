//
//  Reactive+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 05/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import RGRoutable

public extension MutableProperty {

	func producer<T>(asType: T.Type) -> SignalProducer<T, NoError> {
		return producer
			.map { $0 as? T }
			.skipNil()
	}
}

public extension SignalProducer {

	func bind<U>(_ closure: @escaping (Value) -> SignalProducer<U, Error>) -> SignalProducer<U, Error> {
		return flatMap(.latest, closure)
	}

	func delay(_ interval: TimeInterval) -> SignalProducer<Value, Error> {
		return delay(interval, on: QueueScheduler.main)
	}
}

public extension SignalProducer where Error == NoError {

	func toVoid() -> SignalProducer<Void, NoError> {
		return map { _ in () }
	}

	func toRoute(_ routeTransform: ((Value) -> RoutableData)? = nil, sender: Routable) -> SignalProducer<RoutablePayload, NoError> {
		return map { [weak sender] (value: Value) -> RoutablePayload? in
			guard let weakSender = sender else {
				return nil
			}
			return RoutablePayload(data: routeTransform?(value), sender: weakSender)
			}.skipNil()
	}
}

public extension Signal {

	func bind<U>(_ closure: @escaping (Value) -> Signal<U, Error>) -> Signal<U, Error> {
		return flatMap(.latest, closure)
	}

	func delay(_ interval: TimeInterval) -> Signal<Value, Error> {
		return delay(interval, on: QueueScheduler.main)
	}
}

public extension Signal where Error == NoError {

	func toVoid() -> Signal<Void, NoError> {
		return map { _ in () }
	}

	func toRoute(_ routeTransform: ((Value) -> RoutableData)? = nil, sender: Routable) -> Signal<RoutablePayload, NoError> {
		return map { [weak sender] (value: Value) -> RoutablePayload? in
			guard let weakSender = sender else {
				return nil
			}
			return RoutablePayload(data: routeTransform?(value), sender: weakSender)
			}.skipNil()
	}
}
