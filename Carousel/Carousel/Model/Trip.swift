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

	Trip.init(image: "desert", title: "Lets get"),
	Trip.init(image: "desert2", title: "started"),
	Trip.init(image: "baby", title: "with"),
	Trip.init(image: "mountain", title: "the"),
	Trip.init(image: "pinkblur", title: "Onboarding"),
	Trip.init(image: "watercolor", title: "Process")

]

