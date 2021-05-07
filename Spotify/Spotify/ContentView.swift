//
//  ContentView.swift
//  Spotify
//
//  Created by Cong Le on 08/05/2021.
//

import SwiftUI

struct ContentView: View {
	    var body: some View {
		HStack(spacing: 0) {
			
			let lightWhite = Color.white.opacity(0.7)
			
			SideTabView()
			
			// main content
			ScrollView(showsIndicators: false, content: {
				
			})
		}
		.background(Color("bg").ignoresSafeArea())
	
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

