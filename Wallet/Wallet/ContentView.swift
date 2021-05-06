//
//  ContentView.swift
//  Wallet
//
//  Created by Cong Le on 05/05/2021.
//

import SwiftUI

struct ContentView: View {
	
	@State var currentTab = "Incomings"
	
	// For segment Tab Slide...
	@Namespace var animation
	
    var body: some View {
	
		VStack {
			
			HStack {
				Button.init(action: {}, label: {
					Image("menu")
						.resizable()
						.renderingMode(.original)
						.frame(width: 28, height: 28)
//						.foregroundColor(.white)
				})
				
				Spacer(minLength: 0)
				
				Button.init(action: {}, label: {
					Image("grid")
						.resizable()
						.renderingMode(.original)
						.frame(width: 28, height: 28)
//						.foregroundColor(.white)

				})
				
			}
			.padding()
			
			Text("Statistics")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.white)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading)
			
			
			// Custom segmented picker
			HStack {
				
				Text("Incomings")
					.fontWeight(.bold)
					.padding(.vertical, 12)
					.padding(.horizontal, 25)
					.background(
						ZStack {
							if currentTab == "Incomings" {
								Color.white
									.cornerRadius(10)
									.matchedGeometryEffect(id: "TAB", in: animation)
							}
						}
					)
					.foregroundColor(currentTab == "Incomings" ? .black : .white)
					.onTapGesture {
						withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
							currentTab = "Incomings"
						}
					}
				
				Text("Outgoings")
					.fontWeight(.bold)
					.padding(.vertical, 12)
					.padding(.horizontal, 25)
					.background(
						ZStack {
							if currentTab == "Outgoings" {
								Color.white
									.cornerRadius(10)
									.matchedGeometryEffect(id: "TAB", in: animation)
							}
						}
					)
					.foregroundColor(currentTab == "Outgoings" ? .black : .white)
					.onTapGesture {
						withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
							currentTab = "Outgoings"
						}
					}
			}
			.padding(.vertical, 7)
			.padding(.horizontal, 10)
			.background(Color.black.opacity(0.35))
			.cornerRadius(10)
			.padding(.top)
			
			//money view
			HStack(spacing: 37) {
				ZStack {
					
					Circle().stroke(Color.white.opacity(0.2), lineWidth: 22)

					Circle()
						.trim(from: 0, to: 0.6)
					.stroke(Color.yellow, style: StrokeStyle.init(lineWidth: 22, lineCap: .round, lineJoin: .round))
						.rotationEffect(.init(degrees: -90))
					
					Image(systemName: "dollarsign.square.fill")
						.font(.system(size: 55, weight: .bold))
						.foregroundColor(.white)
					
				}
				.frame(maxWidth: 180)
				
				VStack(alignment: .leading, spacing: 10, content: {

					Text("Spent")
						.fontWeight(.bold)
						.foregroundColor(.white.opacity(0.6))

					Text("$190")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(.white)

					Text("Maximum")
						.fontWeight(.bold)
						.foregroundColor(.white.opacity(0.6))
						.padding(.top,10)

					Text("$500")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(.white)

				})
				.frame(maxWidth: .infinity, alignment: .leading)

			}
			.padding(.leading, 30)

			VStack {
				
				Capsule()
					.fill(Color.gray)
					.frame(width: 100, height: 2)
				
				
				HStack(spacing: 15) {
					
					VStack(alignment: .leading, spacing: 10, content: {
						
						Text("Your Balance")
							.font(.title)
							.fontWeight(.bold)
							.foregroundColor(.black)
						
						Text("May 1 2021")
							.font(.caption)
							.fontWeight(.bold)
							.foregroundColor(.gray)
					})
					
					Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
					
					Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
						
						Image(systemName: "square.and.arrow.up.fill")
							.font(.title2)
							.foregroundColor(.black)
					})
				}
				
				HStack {
					
					
				}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
			.padding()
			.background(
				Color.white
					.clipShape(CustomShape(corners: [.topLeft, .topRight], radius: 35))
					.ignoresSafeArea(.all, edges: .bottom)
			)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("bg").ignoresSafeArea())
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
