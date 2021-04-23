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
		SettingsCellVM.init(title: "Settings", cellType: .heading, isSelectable: false),

		SettingsCellVM.init(title: "Account", cellType: .title, isSelectable: false),
		SettingsCellVM.init(iconName: "", title: "Cong Le", subTitle: "Personal Info", arrowName: "", cellType: .account),

		SettingsCellVM.init(title: "Settings", cellType: .title, isSelectable: false),
		SettingsCellVM.init(iconName: "", title: "Language", subTitle: "English", arrowName: "", cellType: .language),
		SettingsCellVM.init(iconName: "", title: "Notifications", subTitle: "", arrowName: "", cellType: .settings),
		SettingsCellVM.init(iconName: "", title: "Dark Mode", subTitle: "On", arrowName: "", cellType: .darkmode),
		SettingsCellVM.init(iconName: "", title: "Help", subTitle: "", arrowName: "", cellType: .settings)
	]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.register(cellType: AccountCell.self)
		self.tableView.register(cellType: TitleCell.self)
		self.tableView.register(cellType: HeadingCell.self)
		self.tableView.register(cellType: DarkModeCell.self)
		self.tableView.register(cellType: LanguageCell.self)
		self.tableView.register(cellType: SettingsCell.self)
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.tableView.reloadData()
		
		print(items.count)
		
		self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = self.items[indexPath.row]
		
		
		switch item.cellType {
		case .account:
			if let cell = tableView.dequeueReusableCell(withIdentifier:AccountCell.reuseIdentifier, for: indexPath) as? AccountCell {
				cell.setViewModel(viewModel: item)
				return cell
			}
		case .title:
			if let cell = tableView.dequeueReusableCell(withIdentifier:TitleCell.reuseIdentifier, for: indexPath) as? TitleCell {
				cell.setViewModel(viewModel: item)
				cell.selectionStyle = .none

				return cell
			}
			
		case .heading:
			if let cell = tableView.dequeueReusableCell(withIdentifier:HeadingCell.reuseIdentifier, for: indexPath) as? HeadingCell {
				cell.setViewModel(viewModel: item)
				cell.selectionStyle = .none

				return cell
			}
			
		case .settings:
			if let cell = tableView.dequeueReusableCell(withIdentifier:SettingsCell.reuseIdentifier, for: indexPath) as? SettingsCell {
				cell.setViewModel(viewModel: item)
				
				return cell
			}
			
		case .language:
			if let cell = tableView.dequeueReusableCell(withIdentifier:LanguageCell.reuseIdentifier, for: indexPath) as? LanguageCell {
				cell.setViewModel(viewModel: item)
				
				return cell
			}
			
		case .darkmode:
			if let cell = tableView.dequeueReusableCell(withIdentifier:DarkModeCell.reuseIdentifier, for: indexPath) as? DarkModeCell {
				cell.setViewModel(viewModel: item)
				
				return cell
			}
			
		}
		
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
}


