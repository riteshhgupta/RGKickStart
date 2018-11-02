//
//  AttributableString.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 04/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

public struct StringAttribute {

	let text: String
	let attributes: [Attribute]
}

public extension StringAttribute {

	enum Attribute {

		case font(UIFont)
		case textColor(UIColor)
		case kern(CGFloat)
	}
}

extension StringAttribute.Attribute {

	var dict: [NSAttributedString.Key: Any] {
		switch self {
		case .font(let value): return [.font: value]
		case .textColor(let value): return [.foregroundColor: value]
		case .kern(let value): return [.kern: value]
		}
	}
}

protocol AttributableString {

	var string: String { get }
	func attributedString(with attributes: [StringAttribute]) -> NSMutableAttributedString
}

extension String: AttributableString {

	var string: String {
		return self
	}

	func attributedString(with attributes: [StringAttribute]) -> NSMutableAttributedString {
		let attributedString = NSMutableAttributedString(string: string)
		attributes.forEach {
			let dict: [NSAttributedString.Key: Any] = $0.attributes.map { $0.dict }.flattenToDictionary()
			if let _range = range(subString: $0.text) {
				attributedString.addAttributes(
					dict,
					range: _range
				)
			}
		}
		return attributedString
	}

    func with(attributes: [StringAttribute.Attribute]) -> StringAttribute {
        return StringAttribute(
            text: self,
            attributes: attributes
        )
    }
}

fileprivate extension Array {

	func flattenToDictionary<Key: Hashable, Value>() -> Dictionary<Key, Value> {
		guard let elements = self as? [Dictionary<Key, Value>] else { return [:] }
		var dict: Dictionary<Key, Value> = [:]
		elements.forEach { $0.forEach { dict[$0.key] = $0.value } }
		return dict
	}
}

fileprivate extension String {

	func substringPosition(_ subString: String) -> Int? {
		guard contains(subString) else { return nil }
		let subStringRange: Range<String.Index> = range(of: subString)!
		let lPos = distance(from: startIndex, to: subStringRange.lowerBound)
		return lPos
	}

	func range(subString: String? = nil) -> NSRange? {
		guard let subString = subString, let substringPosition = substringPosition(subString) else { return nil }
		return NSRange(
			location: substringPosition,
			length: subString.count
		)
	}
}
