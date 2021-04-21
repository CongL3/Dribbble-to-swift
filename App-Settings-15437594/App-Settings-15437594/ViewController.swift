//
//  ViewController.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
	let items: [SettingsCellVM] = [
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .heading),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .title),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .account),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .title),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .language),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .settings),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .darkmode),
			SettingsCellVM.init(iconName: "", title: "", subTitle: "", arrowName: "", cellType: .settings)
		]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.tableView.register(cellType: AccountCell.self)
		self.tableView.register(cellType: TitleCell.self)
		self.tableView.register(cellType: HeadingCell.self)
		self.tableView.register(cellType: DarkModeCell.self)
		self.tableView.register(cellType: LanguageCell.self)
		self.tableView.register(cellType: SettingsCell.self)
	
	}


	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = self.items[indexPath.row]


		switch item.cellType {
		case .account:
			if let cell = tableView.dequeueReusableCell(withIdentifier:AccountCell.reuseIdentifier, for: indexPath) as? AccountCell {
					
				return cell
			}
		case .title:
			if let cell = tableView.dequeueReusableCell(withIdentifier:TitleCell.reuseIdentifier, for: indexPath) as? TitleCell {
					
				return cell
			}

		case .heading:
			if let cell = tableView.dequeueReusableCell(withIdentifier:HeadingCell.reuseIdentifier, for: indexPath) as? HeadingCell {
					
				return cell
			}

		case .settings:
			if let cell = tableView.dequeueReusableCell(withIdentifier:SettingsCell.reuseIdentifier, for: indexPath) as? SettingsCell {
					
				return cell
			}

		case .language:
			if let cell = tableView.dequeueReusableCell(withIdentifier:LanguageCell.reuseIdentifier, for: indexPath) as? LanguageCell {
					
				return cell
			}

		case .darkmode:
			if let cell = tableView.dequeueReusableCell(withIdentifier:DarkModeCell.reuseIdentifier, for: indexPath) as? DarkModeCell {
					
				return cell
			}

		}
		
		return UITableViewCell()
	}
}

