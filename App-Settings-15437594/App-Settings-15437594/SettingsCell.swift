//
//  SettingsCell.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation
import UIKit
import Reusable

final class SettingsCell: UITableViewCell, NibReusable {
	
	@IBOutlet weak var arrowImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!
	
	func setViewModel(viewModel: SettingsCellVM) {
		self.arrowImageView.image = UIImage(named: viewModel.arrowName)
		self.titleLabel.text = viewModel.title
		self.iconImageView.image = UIImage(named: viewModel.iconName)
	}
}
