//
//  Song.swift
//  Spotify
//
//  Created by Cong Le on 08/05/2021.
//

import SwiftUI

struct Song: Identifiable {
	
	var id = UUID().uuidString
	var albumName : String
	var albumAuthor : String
	var albumCover : String
}

var recentlyPlayed = [

	Song(albumName: "Privacy", albumAuthor: "Cardi B", albumCover: "p1"),
	Song(albumName: "Square Shap", albumAuthor: "Dino man", albumCover: "p2"),
	Song(albumName: "Starboy", albumAuthor: "Star Man", albumCover: "p3"),
	Song(albumName: "Privacy", albumAuthor: "Cardi B", albumCover: "p5")
]

var likedSongs = [
	
	Song(albumName: "Square Shap", albumAuthor: "Dino man", albumCover: "p6"),
	Song(albumName: "Starboy", albumAuthor: "Star Man", albumCover: "p7"),
	Song(albumName: "Pink", albumAuthor: "Black pink", albumCover: "p8"),
	Song(albumName: "Privacy", albumAuthor: "Cardi B", albumCover: "p9"),
	Song(albumName: "Square Shap", albumAuthor: "Dino man", albumCover: "p10"),
	Song(albumName: "Starboy", albumAuthor: "Star Man", albumCover: "p11"),
	Song(albumName: "Pink", albumAuthor: "Black pink", albumCover: "p12"),
	Song(albumName: "Pink", albumAuthor: "Black pink", albumCover: "p13"),
	Song(albumName: "Pink", albumAuthor: "Black pink", albumCover: "p14"),
	Song(albumName: "Pink", albumAuthor: "Black pink", albumCover: "p15")
]

var genres = ["Classic", "Hip-Hop", "Electronic", "Chilout", "Dark", "Clam", "Dance", "Ambient"]
