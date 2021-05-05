//
//  Trip.swift
//  Carousel
//
//  Created by Cong Le on 04/05/2021.
//

import Foundation

struct Trip: Identifiable, Hashable {

	var id = UUID().uuidString
	var image: String
	var title: String

//	static func == (lhs: Trip, rhs: Trip) -> Bool {
//		return lhs.id == rhs.id
//	}
//
//	func hash(into hasher: inout Hasher) {
//		hasher.combine(id)
//	}

}

var trips = [

	Trip.init(image: "baby", title: "My Baby"),
	Trip.init(image: "brickwall", title: "Brickwall"),
	Trip.init(image: "desert", title: "Desert"),
	Trip.init(image: "pinkblur", title: "Pink blur"),
	Trip.init(image: "watercolor", title: "Water color")

]

