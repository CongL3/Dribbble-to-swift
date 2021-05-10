//
//  ContentView.swift
//  NationalGeo
//
//  Created by Cong Le on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
	
	init() {
		// 1.
		UINavigationBar.appearance().backgroundColor = UIColor.init(Color("bg"))
		
		//		// 2.
		//		UINavigationBar.appearance().largeTitleTextAttributes = [
		//			.foregroundColor: UIColor.darkGray,
		//			.font : UIFont(name:"Papyrus", size: 40)!]
		//
		//		// 3.
		//		UINavigationBar.appearance().titleTextAttributes = [
		//			.font : UIFont(name: "HelveticaNeue-Thin", size: 20)!]
	}
	
	var body: some View {
		
		NavigationView {
			ZStack {
				Color("bg").ignoresSafeArea()
				
				ScrollView(.vertical, showsIndicators: false) {
					
					VStack {
						
						HStack {
							ScrollView(.horizontal, showsIndicators: false, content: {
								HStack(spacing: 10) {
									
									ForEach(topStories){item in
										ZStack {
											Image(item.image)
												.resizable()
												.aspectRatio(contentMode: .fill)
												.frame(width: 370, height: 250)
												.cornerRadius(10)
												.onTapGesture {
												}
											Spacer(minLength: 0)
											
											Text(item.title)
												.foregroundColor(Color.white)
												.frame(width: 370, height: 60)
												.lineLimit(2)
												.background(Color.black.opacity(0.8))
												.clipShape(CustomShape(corners: [.bottomLeft, .bottomRight], radius: 10))
												.zIndex(1)
												.offset(y: 95)

										}
									}
								}
								.padding(.leading, 10)
								
							})
							
							Spacer(minLength: 0)
							
						}
						
						HStack {
							Rectangle()
								.fill(Color("theme"))
								.frame(width: 10, height: 30)
								.padding(.leading, 10)
							
							Text("Today's picks")
								.foregroundColor(.white)
								.font(.title3)
								.padding(.leading, 5)
							
							Spacer()
							
							Image(systemName: "chevron.right")
								.foregroundColor(Color.white)
								.font(.title)
								.padding(8)
								.background(Color.white.opacity(0.1))
								.cornerRadius(5)
								.padding(.trailing, 10)
						}
						.padding(.top, 10)
						.padding(.bottom, 10)
						
						HStack () {
							ScrollView(.horizontal, showsIndicators: false, content: {
								HStack(spacing: 20) {
									ForEach(articles){item in
										HStack {
											VStack(alignment: .leading) {
												Text(item.title)
													.font(.body)
													.foregroundColor(.white)
													.frame(height: 70)
													.padding(.leading, 20)
												
												Text(item.author)
													.font(.caption)
													.lineLimit(1)
													.foregroundColor(.yellow)
													.padding(.leading, 20)
												
												Spacer()
												
												Button(action: {}, label: {
													Text("Read Here")
														.fontWeight(.bold)
														.foregroundColor(.black)
														.padding(.top, 5)
														.padding(.leading, 15)
														.padding(.trailing, 15)
														.padding(.bottom, 5)
														.background(Color(.white))
														.cornerRadius(3)
												})
												.padding(.leading, 20)
												
												Spacer()
												Rectangle()
													.fill(Color("theme"))
													.frame(height: 5)
												
											}
											.frame(width: 220, height: 170)
											//									.padding(.leading, 5)
											
											
											
											Image(item.image)
												.resizable()
												.aspectRatio(contentMode: .fill)
												.frame(width: 130, height: 170)
												.cornerRadius(1)
												.padding(.leading, -8)
											
										}
										.background(Color(.black))
									}
								}
								.padding(.leading, 10)
								//						.frame(width: 370, height: 100)
								
							})
							
							Spacer(minLength: 0)
							
						}
						
						HStack {
							Rectangle()
								.fill(Color("theme"))
								.frame(width: 10, height: 30)
								.padding(.leading, 10)
							
							Text("Nat geo Tv")
								.foregroundColor(.white)
								.font(.title3)
								//						.background(Color.green)
								.padding(.leading, 5)
							
							Spacer()
							
							Image(systemName: "chevron.right")
								.foregroundColor(Color.white)
								.font(.title)
								.padding(8)
								.background(Color.white.opacity(0.1))
								.cornerRadius(5)
								.padding(.trailing, 10)
						}
						.padding(.top, 10)
						.padding(.bottom, 10)
						
						Spacer()
						
						HStack {
							ScrollView(.horizontal, showsIndicators: false, content: {
								HStack(spacing: 10) {
									ForEach(1...5, id: \.self){i in
										Image("b\(i)")
											.resizable()
											.aspectRatio(contentMode: .fill)
											.frame(width: 170, height: 260)
											.onTapGesture {
											}
									}
								}
								.padding(.leading, 10)
							})
							
							Spacer(minLength: 0)
							
						}
						
					}
				}
				.navigationBarItems(leading:
										Image("natgeologo")
										.resizable()
										.aspectRatio(contentMode: .fill)
										.frame(width: 100, height: 90)
										.padding(.leading, 20)
										.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top),
									trailing:
										Image(systemName: "magnifyingglass")
										.font(.system(size: 30))
										.foregroundColor(.white)
										.padding(.top, 50)
									
				)
				
			}
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct Article: Identifiable {
	var id = UUID().uuidString
	var author: String
	var title: String
	var image: String
}

var articles = [
	Article(author: "By Alaskan adventure", title: "Venture into the wilds of Alaska to experience", image: "a1"),
	Article(author: "By Everest’s man", title: "What does a COVID-19 outbreak mean for life at Everest’s base camp?", image: "a2"),
	Article(author: "BY Jonathan Irish", title: "The Grand Canyon receives about 6 million visitors a year.", image: "a3")
]

var topStories = [
	Article(author: "", title: "Chimpanzee moms are like us: They mourn, dote, and take 'me' time.", image: "s1"),
	Article(author: "", title: "What does a COVID-19 outbreak mean for life at Everest’s base camp?", image: "s2"),
	Article(author: "", title: "The Grand Canyon receives about 6 million visitors a year.", image: "s3"),
	Article(author: "", title: "7 Things You Don't Know About Mother's Day's Dark History", image: "s4")
]
