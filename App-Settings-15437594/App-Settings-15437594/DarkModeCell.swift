//
//  DarkModeCell.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation
import UIKit
import Reusable

class DarkModeCell: UITableViewCell, NibReusable {
	@IBOutlet weak var `switch`: UISwitch!
	
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var logoImageView: UIImageView!
	
	func setViewModel(viewModel: SettingsCellVM) {
		self.titleLabel.text = viewModel.title
		self.subtitleLabel.text = viewModel.subTitle
		self.logoImageView.image = UIImage(named: viewModel.iconName)
	}
}
