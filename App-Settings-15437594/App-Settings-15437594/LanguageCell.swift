//
//  LanguageCell.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation
import UIKit
import Reusable

class LanguageCell: UITableViewCell, NibReusable {
	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var arrowImageView: UIImageView!
	
	func setViewModel(viewModel: SettingsCellVM) {
		self.logoImageView.image = UIImage(named: viewModel.iconName)
		self.titleLabel.text = viewModel.title
		self.subtitleLabel.text = viewModel.subTitle
		self.arrowImageView.image = UIImage(named: viewModel.arrowName)
	}
	
}
