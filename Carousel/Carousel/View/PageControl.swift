//
//  PageControl.swift
//  Carousel
//
//  Created by Cong Le on 05/05/2021.
//

import SwiftUI

struct PageControl: UIViewRepresentable {

	let maxPage: Int
	let currentPage: Int
	
	func makeUIView(context: Context) -> UIPageControl {

		let control = UIPageControl()
		control.backgroundStyle = .minimal
		control.numberOfPages = maxPage
		control.currentPage = currentPage
		
		return control
	}

	func updateUIView(_ uiView: UIPageControl, context: Context) {
		uiView.currentPage = currentPage
	}
	
}

