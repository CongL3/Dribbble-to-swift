//
//  AccountCell.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation
import UIKit
import Reusable

class AccountCell: UITableViewCell, NibReusable {
	
	@IBOutlet weak var logoImageView: UIImageView!
	
	@IBOutlet weak var subTitleLabel: UILabel!
	@IBOutlet weak var arrowImageview: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	func setViewModel(viewModel: SettingsCellVM) {
		
		self.logoImageView.image = UIImage(named: viewModel.arrowName)
		self.titleLabel.text = viewModel.title
		self.subTitleLabel.text = viewModel.subTitle
		self.arrowImageview.image = UIImage(named: viewModel.arrowName)
	}
}
