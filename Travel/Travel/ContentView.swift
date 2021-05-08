//
//  ContentView.swift
//  Travel
//
//  Created by Cong Le on 08/05/2021.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		MainView()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct MainView : View {
	
	//	@State var selectedTab = "magnifyingglass"
	
	@State var selectedIndex = 0
	@State var shouldShowModel = false
	
	var body: some View {
		
		VStack (spacing: 0){
			ZStack {
				
				
				Liked(shouldShowModel: $shouldShowModel)
				
				switch selectedIndex {
				case 0:
					Home()
				case 1:
					Map()
				case 3:
					Account()
				default:
					NavigationView{
						Text("default")
						
					}
				}
			}
			
			Divider()
				.padding(.bottom, 8)
				.background(Color.white)

			HStack {
				ForEach(0..<5) { num in
					Spacer()
					Button(action: {
						if num == 2 {
							shouldShowModel.toggle()
							return
						}
						
						selectedIndex = num
					}, label: {
						
						if num == 2 {
							Image(systemName: tabs[num].imageName)
								.font(.system(size: 40, weight: .bold))
								//								.padding(.top, 5)
								.padding(.bottom, 10)
								.foregroundColor(.red)
						} else {
							Image(systemName: tabs[num].imageName)
								.font(.system(size: 24, weight: .bold))
								//								.padding(.top, 5)
								.padding(.bottom, 10)
								.foregroundColor(selectedIndex == num ? .black : .black.opacity(0.2))
						}
					})
					
					Spacer()
				}
			}
			.background(Color.white)
			.ignoresSafeArea()

		}
		.background(Color("bg"))
		.ignoresSafeArea()
		
		//		VStack(spacing: 0) {
		//
		//			Spacer()
		//
		//			HStack(spacing: 0) {
		//				TabButton(image: "magnifyingglass", selectedTab: $selectedTab)
		//				Spacer(minLength: 0)
		//				TabButton(image: "heart", selectedTab: $selectedTab)
		//				Spacer(minLength: 0)
		//				TabButton(image: "map", selectedTab: $selectedTab)
		//				Spacer(minLength: 0)
		//				TabButton(image: "person.crop.circle.fill", selectedTab: $selectedTab)
		//			}
		//			.frame(maxWidth: .infinity)
		//			.padding(.vertical)
		//			// logic for smaller iphones
		//			//			.padding(.bottom, UIApplication.shared.windows.first!.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first!.safeAreaInsets.bottom)
		//			.edgesIgnoringSafeArea(.all)
		//
		//		}
	}
}

struct Home: View {
	
	var body: some View {
		
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				HStack {
					Text("Discover a\nDifferent worlds")
						.font(.system(size: 30, weight: .bold))
						.foregroundColor(Color("text"))
					Spacer(minLength: 0)
					Button(action: {}, label: {
						
						Image(systemName: "magnifyingglass")
							.renderingMode(.template)
							.foregroundColor(.white)
							.padding()
							.background(Color("theme"))
							.clipShape(Circle())
					})
				}
				.padding()
				.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
				
				ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
					HStack(spacing: 10) {
						ForEach(1...5, id: \.self){i in
							Image("r\(i)")
								.frame(width: 100, height: 100)
								.clipShape(Circle())
								.onTapGesture {
								}
						}
					}
					.padding(.leading, 10)
				})
				
				// Desinations
				HStack {
					Text("Destinations")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(Color("text"))
					
					Spacer()
					
					Button(action: {}, label: {
						Text("See all")
							.foregroundColor(.gray)
					})
				}
				.padding()
				
				ForEach(data){travel in
						
					ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
						
						Image("\(travel.img)")
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: UIScreen.main.bounds.width - 40, height:300)
							.cornerRadius(25)
						
						VStack(alignment: .trailing, spacing: 4) {
							
							Text(travel.title)
								.font(.title)
								.fontWeight(.bold)
								.foregroundColor(Color("text"))

							Text(travel.country)
								.fontWeight(.bold)
								.foregroundColor(Color("text"))

						}
						.padding(.trailing, 20)
						.padding(.top, 10)
						
					}
					.padding()
					
				}
			}

		}

	}
}

struct Map: View {
	
	var body: some View {
		VStack {
			Spacer()
			Text("Map")
			Spacer()
		}
	}
}

struct Liked: View {
	@Binding var shouldShowModel: Bool
	
	var body: some View {
		Spacer()
			.fullScreenCover(isPresented: $shouldShowModel, content: {
				Button(action: {shouldShowModel.toggle()}, label: {
					Text("Fullscreen cover")
				})
			})
	}
}

struct Account: View {
	
	var body: some View {
		VStack {
			Spacer()
			Text("Account")
			Spacer()
		}
	}
}


struct TabButton: View {
	var image: String
	//	@Binding var selectedTab: String
	
	var body: some View {
		
		Button(action: {
			
		}, label: {
			Image(systemName: image)
				.font(.system(size: 24, weight: .bold))
				//				.foregroundColor(selectedTab == image ? .black : .gray.opacity(0.6))
				//				.frame(maxHeight: .infinity)
				//			Text(selectedTab == image ? image : "" )
				.foregroundColor(.black)
		})
		.padding(.vertical, 10)
		//		.padding(.horizontal)
		//		.background(Color.black.opacity(image == selectedTab ? 1 : 0))
		//		.clipShape(Capsule())
	}
}

struct Model : Identifiable {
	
	var id = UUID().uuidString
	var title: String
	var country: String
	var ratings: String
	var price: String
	var img: String
}

var data = [
	Model(title: "Carribean", country: "Jamica", ratings: "4.5", price: "$200", img: "p1"),
	Model(title: "Da Nang", country: "Vietnam", ratings: "4.5", price: "$200", img: "p2")
]
