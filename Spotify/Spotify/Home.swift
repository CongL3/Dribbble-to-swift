//
//  Home.swift
//  Spotify
//
//  Created by Cong Le on 08/05/2021.
//

import SwiftUI

struct Home: View {
	
	@State var searchText = ""
	var body: some View {
		HStack(spacing: 0) {
			
			//let lightWhite = Color.white.opacity(0.7)
			SideTabView()
			
			// main content
			ScrollView(showsIndicators: false, content: {
				
				VStack(spacing: 15) {
					
					// search + profile
					HStack(spacing: 15) {
						
						HStack(spacing: 15) {
							Circle()
								.stroke(Color.white, lineWidth: 4)
								.frame(width: 35, height: 35)
							
							TextField("Search...", text: $searchText)
						}
						.padding(.vertical, 10)
						.padding(.horizontal)
						.background(Color.white.opacity(0.08))
						.cornerRadius(8)
						
						Button(action: {}, label: {
							Image("profile")
								.resizable()
								.aspectRatio(contentMode: .fill)
								.frame(width: 45, height: 45)
								.cornerRadius(10)
						})
					}
					
					Text("Recently played")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.top, 30)
					
					// carousel list
					TabView {
						
						ForEach(recentlyPlayed) { item in
							
							GeometryReader { proxy in
								ZStack(alignment: .bottomLeading) {
									Image(item.albumCover)
										.resizable()
										.aspectRatio(contentMode: .fill)
										.frame(width: proxy.frame(in: .global).width)
										.cornerRadius(20)
										//									.padding(.horizontal)
										//dark shading at bottom so for text
										.overlay(
											LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
												.cornerRadius(20)
										)
									
									HStack(spacing: 15) {
										
										Button(action: {}, label: {
											Image(systemName: "play.fill")
												.font(.title2)
												.foregroundColor(.white)
												.padding(20)
												.background(Color("logoColor"))
												.clipShape(Circle())
										})
										
										VStack(alignment: .leading, spacing: 5, content: {
											
											Text(item.albumName)
												.font(.title2)
												.fontWeight(.heavy)
												.foregroundColor(.white)
											
											Text(item.albumAuthor)
												.font(.none)
												.fontWeight(.bold)
												.foregroundColor(.white)
										})
									}
									.padding()
								}

							}
							.padding(.horizontal)
							.frame(height: 350)
						}
					}
					.frame(height: 350)
					.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
					.padding(.top, 20)
					
					Text("Genre")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.top, 30)
					
					LazyVGrid(columns: Array(repeating:
												GridItem(.flexible(), spacing: 15),count: 3), spacing: 15, content: {
													
													ForEach(genres, id: \.self) {genre in
														
														Text(genre)
															.fontWeight(.semibold)
															.foregroundColor(.white)
															.padding(.vertical, 8)
															.frame(maxWidth: .infinity)
															.background(Color.white.opacity(0.06))
															.clipShape(Capsule())
													}
												})
					
					
					Text("Liked Songs")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.top, 30)
					
					
					LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10),count: 2), spacing: 10,
							  content: {
								
								ForEach(likedSongs.indices, id: \.self){ index in
									GeometryReader{ proxy in
										
										Image(likedSongs[index].albumCover)
											.resizable()
											.aspectRatio(contentMode: .fill)
											.frame(width: proxy.frame(in: .global).width, height: 150)
											.clipShape(CustomCorners(corners: index % 2 == 0 ? [.topLeft, .bottomLeft] : [.topRight, .bottomRight], radius: 15))
									}
									.frame(height: 150)
								}
						})
						.padding(.horizontal)
				}
				.padding()
				.frame(maxWidth: .infinity)
			})
		}
		.background(Color("bg").ignoresSafeArea())
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home()
	}
}

struct CustomCorners: Shape {
	var corners: UIRectCorner
	var radius: CGFloat

	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

		return Path(path.cgPath)
	}
}
