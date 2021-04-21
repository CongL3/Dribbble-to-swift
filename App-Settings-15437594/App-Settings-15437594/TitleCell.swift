//
//  TitleCell.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation
import UIKit
import Reusable

class TitleCell: UITableViewCell, Reusable {
	
	@IBOutlet weak var titleLabel: UILabel!

	func setViewModel(viewModel: SettingsCellVM) {
		self.titleLabel.text = viewModel.title
	}
}
