//
//  SettingsCellVM.swift
//  App-Settings-15437594
//
//  Created by Cong Le on 22/04/2021.
//

import Foundation

enum CellType {
	case title
	case heading
	case settings
	case account
	case language
	case darkmode
}

struct SettingsCellVM {
	let iconName: String
	let title: String
	var subTitle: String
	let arrowName: String
	let cellType: CellType
}
