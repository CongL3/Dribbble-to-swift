//
//  Home.swift
//  Carousel
//
//  Created by Cong Le on 04/05/2021.
//

import SwiftUI

struct Home: View {
	@State var selectedTab: Trip = trips[0]

	
	init() {
		UIScrollView.appearance().bounces = false
	}
	
    var body: some View {
		ZStack {
			
			GeometryReader { proxy in
				
				let frame = proxy.frame(in: .global)
				
				Image(selectedTab.image)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: frame.width, height: frame.height, alignment: .center)
					.cornerRadius(0)
			}
			.ignoresSafeArea()
			
			// Carousel
			VStack {
				
				Text("Lets get started with")
					.fontWeight(.bold)
					.foregroundColor(.black)
				
				Text("Onboarding")
					.font(.largeTitle)
					.fontWeight(.heavy)
					.foregroundColor(.black)
					.padding(.bottom, 30)
								
				VStack {
					
					GeometryReader { proxy in
						
						let frame = proxy.frame(in: .global)

						TabView(selection: $selectedTab) {

							ForEach(trips){trip in
								Image(trip.image)
									.resizable()
									.aspectRatio(contentMode: .fill)
									.frame(width: frame.width - 10, height: frame.height, alignment: .center)
									.cornerRadius(4)
									.tag(trip)
								}
						}.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
						
					}
					.frame(height: UIScreen.main.bounds.height/2.2)
					
					Text(selectedTab.title)
						.font(.title)
						.fontWeight(.bold)
						.padding(.top, 20)
						.padding(.bottom, 18)
						.foregroundColor(.white)
					
					// page control
					PageControl(maxPage: trips.count, currentPage: getIndex())
				}
				.padding(.top)
				.padding(.horizontal, 10)
				.padding(.bottom, 5)
				// Clip with custom shhap
				.background(Color.white.clipShape(CustomShape()).cornerRadius(10))
				.padding(.horizontal, 20)
				
				Button(action: {}, label: {
					Text("GET STARTED")
						.fontWeight(.bold)
 						.foregroundColor(.black)
						.padding(.vertical, 18)
						.frame(maxWidth: .infinity)
						.background(Color(.yellow))
						.cornerRadius(10)
				})
				.padding(.top, 30)
				.padding(.horizontal)
			}
			.padding()
		}
	}
	
	// getting index...
	
	func getIndex() -> Int {
		let index = trips.firstIndex { (trip) -> Bool in
			return selectedTab.id == trip.id
		} ?? 0
		
		return index
	}
	
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
		Home()
			.previewLayout(.sizeThatFits)
			
    }
}
