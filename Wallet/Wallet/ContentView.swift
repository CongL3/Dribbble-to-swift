//
//  ContentView.swift
//  Wallet
//
//  Created by Cong Le on 05/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

	
		VStack {
			
			HStack {
				
				
				Button.init(action: {}, label: {
					Image("menu")
					
				})
			}
			
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
