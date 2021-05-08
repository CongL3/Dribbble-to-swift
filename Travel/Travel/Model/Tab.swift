//
//  Tab.swift
//  Travel
//
//  Created by Cong Le on 08/05/2021.
//

import SwiftUI

struct Tab {
	var id = UUID().uuidString
	var title : String
	var imageName : String
}

var tabs = [
	Tab(title: "Explore", imageName: "magnifyingglass"),
	Tab(title: "Map", imageName: "map"),
	Tab(title: "Heart", imageName: "heart.fill"),
	Tab(title: "Account", imageName: "person.crop.circle.fill"),
	Tab(title: "Search", imageName: "magnifyingglass")
]

