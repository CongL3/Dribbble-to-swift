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
	@Namespace var animation
	@State var show = false
	@State var selected : Model = data[0]

	var body: some View {
		
		ZStack {
			VStack (spacing: 0){
				ZStack {
					
					
					Liked(shouldShowModel: $shouldShowModel)
					
					switch selectedIndex {
					case 0:
						Home(animation: animation, show: $show, selected: $selected)
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
			
			if show {
				Detail(selected: $selected, show: $show, animation: animation)
			}
		}
		.ignoresSafeArea()
		.background(Color("bg").edgesIgnoringSafeArea(.all))
		
	}
}

struct Detail: View {
	
	@Binding var selected : Model
	@Binding var show : Bool
	var animation : Namespace.ID

	var body: some View {
	
		VStack {
			
			VStack {
				
				ZStack {
					Image(selected.img)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: UIScreen.main.bounds.width, height: 350)
						.clipShape(RoundedShape(corners: [.bottomRight, .bottomLeft]))
						.matchedGeometryEffect(id: selected.img, in: animation)
					HStack {
						Button(action: {
							withAnimation(.spring()){show.toggle()}
						}, label: {
							Image(systemName: "chevron.left")
								.foregroundColor(.black)
								.padding()
								.background(Color.white)
								.clipShape(Circle())
						})

						Spacer()

						Button(action: {}, label: {
							Image(systemName: "suit.heart")
								.foregroundColor(.black)
								.padding()
								.background(Color.white)
								.clipShape(Circle())
						})
					}
					.padding()
					.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
				}
				
				//Details view
				HStack {
					VStack {
						Text(selected.title)
							.font(.title)
							.foregroundColor(Color("text"))
							.fontWeight(.bold)
							.matchedGeometryEffect(id: selected.title, in: animation)

						HStack (spacing: 10) {
							Image("map")
							
							Text(selected.country)
								.foregroundColor(Color.black)
								.matchedGeometryEffect(id: selected.country, in: animation)

							HStack(spacing: 5) {
								Text(selected.ratings)
									.foregroundColor(.black)
								Image(systemName: "star.fill")
									.foregroundColor(.yellow)

							}
						}
					}

					Spacer(minLength: 0)

					Text(selected.ratings)
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(Color("text"))
				}
				.padding()
				.padding(.bottom)

			}
			.background(Color.white)
			.clipShape(RoundedShape(corners: [.bottomRight, .bottomLeft]))

			// scroll view fvor smaller screen
			
			if UIScreen.main.bounds.height < 750 {
				ScrollView(.vertical, showsIndicators: false) {
					BottomView()
				}
			} else {
				BottomView()
			}
			
			Spacer(minLength: 0)
		}
		.background(Color("bg"))
	}
}

struct BottomView: View {

	@State var index = 1
	
	var body: some View {
	
		VStack(alignment: .leading, spacing: 15) {
			
			Text("People")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(Color("text"))
			
			Text("Member of the group")
				.font(.caption)
			
			HStack(spacing: 15) {
				
				ForEach(1...6, id: \.self){i in
					Button(action: {index=i}, label: {
						
						Text("\(i)")
							.fontWeight(.bold)
							.foregroundColor(index == i ? .white: .gray)
							.padding(.vertical, 10)
							.padding(.horizontal)
							.background(Color("theme").opacity(index == i ? 1 : 0.07))
							.cornerRadius(4)
					})
				}
				
				Spacer(minLength: 0)
			}
			.padding(.top)
			
			Text("Description")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(Color("text"))
				.padding(.top, 10)
				
			
			Text("This is the carribean is it very niceeThis is the carribean is it very niceeThis is the carribean is it very nicee")
				.multilineTextAlignment(.leading)
				.background(Color.green)
			
			
			Button(action: {}, label: {
				Text("Book Now")
					.fontWeight(.bold)
					.foregroundColor(Color.white)
					.frame(width: UIScreen.main.bounds.width - 40)
					.padding(.vertical)
					.background(Color("theme"))
					.clipShape(Capsule())
			})
			.padding(.vertical)
			.padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
		}
		.padding()
	}
}

struct Home: View {
	
	var animation: Namespace.ID
	@Binding var show: Bool
	@Binding var selected: Model
	
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
							.matchedGeometryEffect(id: travel.img, in: animation)
						
						VStack(alignment: .trailing, spacing: 4) {
							
							Text(travel.title)
								.font(.title)
								.fontWeight(.bold)
								.foregroundColor(Color("text"))
								.matchedGeometryEffect(id: travel.title, in: animation)

							Text(travel.country)
								.fontWeight(.bold)
								.foregroundColor(Color("text"))
								.matchedGeometryEffect(id: travel.country, in: animation)

						}
						.padding(.trailing, 20)
						.padding(.top, 10)
						
					}
					.padding()
					.onTapGesture {
						withAnimation(.spring()) {
							selected = travel
							show.toggle()
						}
					}
					
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

struct RoundedShape : Shape {
	
	var corners: UIRectCorner
	
	func path(in rect: CGRect) -> Path {
		
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 45, height: 45))
		
		return Path(path.cgPath)
	}
}
