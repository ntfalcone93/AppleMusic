//
//  Album.swift
//  AppleMusic
//
//  Created by Nathan on 4/28/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class Album {
    
    private let kAlbumId = "collectionId"
    private let kAlbumName = "collectionName"
    private let kArtworkUrlString = "artworkUrl100"
    private let kTrackCount = "trackCount"
    private let kReleaseDate = "releaseDate"
    private let kGenre = "primaryGenreName"
    private let kExplicit = "collectionExplicitness"
    
    let albumId: Int
    let albumName: String
    let artworkUrlString: String
    var artworkImage: UIImage?
    let trackCount: Int
    let releaseDate: String
    let genre: String
    let explicit: Bool
    var explicitString: String? = nil
    var artist: Artist?
    
    
    init?(dictionary: [String: AnyObject]) {
        guard let albumId = dictionary[kAlbumId] as? Int,
            albumName = dictionary[kAlbumName] as? String,
            artworkUrlString = dictionary[kArtworkUrlString] as? String,
            trackCount = dictionary[kTrackCount] as? Int,
            releaseDate = dictionary[kReleaseDate] as? String,
            genre = dictionary[kGenre] as? String,
            explicit = dictionary[kExplicit] as? String else {
                return nil
        }
        
        self.albumId = albumId
        self.albumName = albumName
        self.artworkUrlString = artworkUrlString
        self.trackCount = trackCount
        self.releaseDate = releaseDate
        self.genre = genre
        if explicit == "explicit" {
            self.explicit = true
            self.explicitString = "Explicit"
        } else {
            self.explicit = false
        }
        self.artist = nil
        self.artworkImage = nil
    }
}

/*
 wrapperType : "collection"
 collectionType : "Album"
 artistId : 271256
 collectionId : 1108737195
 amgArtistId : 905792
 artistName : "Drake"
 collectionName : "Views"
 collectionCensoredName : "Views"
 artistViewUrl : "https://itunes.apple.com/us/artist/drake/id271256?uo=4"
 collectionViewUrl : "https://itunes.apple.com/us/album/views/id1108737195?uo=4"
 artworkUrl60 : "http://is1.mzstatic.com/image/thumb/Music60/v4/54/06/a3/5406a3ee-262c-b1d4-66be-9d333fe54bae/source/60x60bb.jpg"
 artworkUrl100 : "http://is1.mzstatic.com/image/thumb/Music60/v4/54/06/a3/5406a3ee-262c-b1d4-66be-9d333fe54bae/source/100x100bb.jpg"
 collectionPrice : 13.99
 collectionExplicitness : "explicit"
 contentAdvisoryRating : "Explicit"
 trackCount : 21
 copyright : "℗ 2016 Young Money Entertainment/Cash Money Records"
 country : "USA"
 currency : "USD"
 releaseDate : "2016-04-29T07:00:00Z"
 primaryGenreName : "Hip-Hop/Rap"
 */