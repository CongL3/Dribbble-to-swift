//
//  HeadingCell.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation
import UIKit
import Reusable

class HeadingCell: UITableViewCell, Reusable {
	
	@IBOutlet weak var headingLabel: UILabel!

	func setViewModel(viewModel: SettingsCellVM) {
		self.headingLabel.text = viewModel.title
	}
}
