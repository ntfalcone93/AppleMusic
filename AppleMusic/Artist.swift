//
//  Artist.swift
//  AppleMusic
//
//  Created by Nathan on 4/28/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class Artist {
    
    private let kArtistName = "artistName"
    private let kArtistUrlString = "artistLinkUrl"
    private let kArtistId = "artistId"
    private let kGenreName = "primaryGenreName"
    private let kGenreId = "primaryGenreId"
    
    let name: String
    let artistImageUrlString: String
    let artistId: Int
    let genre: String
    let genreId: Int
    
    init?(dictionary:[String: AnyObject]) {
        guard let name = dictionary[kArtistName] as? String,
        artistImageUrlString = dictionary[kArtistUrlString] as? String,
        artistId = dictionary[kArtistId] as? Int,
        genre = dictionary[kGenreName] as? String,
            genreId = dictionary[kGenreId] as? Int else {
                return nil
        }
        self.name = name
        self.artistImageUrlString = artistImageUrlString
        self.artistId = artistId
        self.genre = genre
        self.genreId = genreId
    }
}

/*
 {
 wrapperType : "artist"
 artistType : "Artist"
 artistName : "Drake"
 artistLinkUrl : "https://itunes.apple.com/us/artist/drake/id271256?uo=4"
 artistId : 271256
 amgArtistId : 905792
 primaryGenreName : "Hip-Hop/Rap"
 primaryGenreId : 18
 }
 */