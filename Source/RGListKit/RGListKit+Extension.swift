//
//  RGListKit+Extension.swift
//  RGKickStart
//
//  Created by Ritesh Gupta on 06/09/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import RGListKit

public extension ReactiveDiffableListViewHolder {

	func item(at index: IndexPath) -> ListViewItemModel {
		return sections[index.section].cells[index.row]
	}

	func itemsOfSection(at index: IndexPath) -> [ListViewItemModel] {
		return sections[index.section].cells
	}
}
