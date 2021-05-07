//
//  SideTabView.swift
//  Spotify
//
//  Created by Cong Le on 08/05/2021.
//

import SwiftUI

struct SideTabView: View {
	
	@State var selectedTab = "house.fill"
	@State var volume: CGFloat = 0
	@State var showSideBar: Bool = false
	
    var body: some View {
		// side bar
		VStack {
			
			Image("logo")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 55, height: 55)
				.padding(.top)
			
			VStack {
				TabButton(image: "house.fill", selectedTab: $selectedTab)
				TabButton(image: "safari.fill", selectedTab: $selectedTab)
				TabButton(image: "mic.fill", selectedTab: $selectedTab)
				TabButton(image: "clock.fill", selectedTab: $selectedTab)
			}
			.frame(height: getRect().height / 2.3)
			.padding(.top, 10)
			
			Spacer(minLength: 50)
			
			Button(action: {
				volume = volume + 0.1 < 1 ? volume + 0.1 : 1
			}, label: {
				Image(systemName: "speaker.wave.2.fill")
					.font(.title2)
					.foregroundColor(.white)
			})
			
			GeometryReader { proxy in
				
				let height = proxy.frame(in: .global).height
				let progress = height * volume
				
				ZStack (alignment: .bottom){
					
					Capsule()
						.fill(Color.gray.opacity(0.5))
						.frame(width: 4)
					
					Capsule()
						.fill(Color.white)
						.frame(width: 4, height: progress)
					
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
				.padding(.vertical, 10)
				
			}
			
			Button(action: {
				volume = volume - 0.1 > 0 ? volume - 0.1 : 0
			}, label: {
				Image(systemName: "speaker.wave.1.fill")
					.font(.title2)
					.foregroundColor(.white)
			})
			
			Button(action: {
				withAnimation(.easeIn) {
					showSideBar.toggle()
				}
				
			}, label: {
				Image(systemName: "chevron.right")
					.font(.title2)
					.foregroundColor(.white)
					//rotating
					.rotationEffect(.init(degrees: showSideBar ? -180 : 0))
					.padding()
					.background(Color.black)
					.cornerRadius(10)
					.shadow(radius: 5)
			})
			.padding(.top, 10)
			.padding(.bottom, getSafeArea().bottom == 0 ? 15 : 0)
			.offset(x: showSideBar ? 0 : 100)
			
		}
		// max side bar width
		.frame(width: 80)
		.background(Color.black.ignoresSafeArea())
		.offset(x: showSideBar ? 0 : -100)
		
		// reclaiming the spacing by using negative spacing
		// commit
		// if we wanna move the whole view with the side bar
		.padding(.trailing, showSideBar ? CGFloat(0) : CGFloat(-100))
		.zIndex(1)
    }
}

struct SideTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton: View {
	var image: String
	@Binding var selectedTab: String
	
	var body: some View {
		
		Button(action: {
			withAnimation{selectedTab = image}
		}, label: {
			Image(systemName: image)
				.font(.title2)
				.foregroundColor(selectedTab == image ? .white : .gray.opacity(0.6))
				.frame(maxHeight: .infinity)
		})
	}
}

extension View {
	func getRect() -> CGRect {
		return UIScreen.main.bounds
	}
	
	func getSafeArea() -> UIEdgeInsets {
		return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
