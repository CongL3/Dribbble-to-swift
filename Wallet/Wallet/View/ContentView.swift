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
	@State var weeks : [Week] = []

	// current week day
	@State var currentDay : Week = Week(day: "", date: "", amountSpent: 0)

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

					let progress = currentDay.amountSpent / 500
					
					Circle()
						.trim(from: 0, to: progress)
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

					let amount = String(format: "%.2f", currentDay.amountSpent)
					
					Text("$\(amount)")
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

			ZStack {
				
				if UIScreen.main.bounds.height < 750 {
					ScrollView(.vertical, showsIndicators: false, content: {
						BottomSheet(weeks: $weeks, currentDay: $currentDay)
							.padding([.horizontal, .top])
							.padding(.bottom)
					})
				} else {
					BottomSheet(weeks: $weeks, currentDay: $currentDay)
						.padding([.horizontal, .top])
					
				}
				
				
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
			.padding([.horizontal, .top])
			.background(
				Color.white
					.clipShape(CustomShape(corners: [.topLeft, .topRight], radius: 35))
					.ignoresSafeArea(.all, edges: .bottom)
			)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("bg").ignoresSafeArea())
		.onAppear(perform: {
			getWeekDays()
		})
	}
	
	
	func getWeekDays() {
		
		let calendar = Calendar.current
		
		let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
		
		guard let startDate = week?.start else {
			return
		}
		
		for index in 0..<7 {
			
			guard let date = calendar.date(byAdding: .day, value: index, to: startDate) else {
				return
			}
			
			let formatter = DateFormatter()
			formatter.dateFormat = "EEE"
			var day = formatter.string(from: date)
			
			//
			day.removeLast()
			
			formatter.dateFormat = "dd"
			
			let dateString = formatter.string(from: date)
			
			weeks.append(
				Week(day: day,
					 date: dateString,
					 amountSpent: index == 0 ? 25: CGFloat(index) * 70))
		}
			
		self.currentDay = weeks.first!
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomSheet: View {
	
	@Binding var weeks: [Week]
	@Binding var currentDay: Week
	
	var body: some View {
		
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
				.offset(x: -10)
			}
			.padding(.top)
			
			HStack {
				
				Text("$22,306.00")
					.fontWeight(.heavy)
					.foregroundColor(.black)
				Spacer(minLength: 0)
				
				Image(systemName: "arrow.up")
					.foregroundColor(.gray)
				
				Text("14%")
					.fontWeight(.semibold)
			}
			.padding(.top, 8)
			
			HStack(spacing: 0) {
				
				ForEach(weeks) { week in
					
					VStack(spacing: 12) {
						
						Text(week.day)
							.fontWeight(.bold)
							.foregroundColor(currentDay.id == week.id ? .white.opacity(0.8) : .black)
						
						Text(week.date)
							.font(.title2)
							.fontWeight(.bold)
							.foregroundColor(currentDay.id == week.id ? .white : .black)
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
					.padding(.vertical)
					.background(Color.yellow.opacity(currentDay.id == week.id ? 1 : 0))
					.clipShape(Capsule())
					.onTapGesture {
						withAnimation {
							currentDay = week
						}
					}
					
				}
				
			}
			.padding(.top, 20)
			
			Button(action: {}, label: {
				Image(systemName: "arrow.right")
					.resizable()
					.foregroundColor(.white)
					.aspectRatio(contentMode: .fit)
					.frame(width: 20, height: 20)
					.padding(.vertical, 15)
					.padding(.horizontal, 50)
					.background(Color("bg"))
					.clipShape(Capsule())
			})
			.padding(.top)
		}

		
	}
	
}
