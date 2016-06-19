//
//  Song.swift
//  AppleMusic
//
//  Created by Nathan on 4/28/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class Song {
    
    private let kTrackId = "trackId"
    private let kTrackName = "trackName"
    private let kTrackNumber = "trackNumber"
    private let kTrackTime = "trackTimeMillis"
    private let kIsStreamable = "isStreamable"
    
    let trackId: Int
    let trackName: String
    let trackNumber: Int
    let trackTime: Int
    let isStreamable: Bool
    var album: Album?
    var artist: Artist?
    
    init?(dictionary: [String: AnyObject]) {
        guard let trackId = dictionary[kTrackId] as? Int,
            trackName = dictionary[kTrackName] as? String,
            trackNumber = dictionary[kTrackNumber] as? Int,
            trackTime = dictionary[kTrackTime] as? Int,
            isStreamable = dictionary[kIsStreamable] as? Bool else {
                return nil
        }
        self.trackId = trackId
        self.trackName = trackName
        self.trackNumber = trackNumber
        self.trackTime = trackTime
        self.isStreamable = isStreamable
        self.album = nil
        self.artist = nil
    }
}

/*
 wrapperType : "track"
 kind : "song"
 artistId : 271256
 collectionId : 1108737195
 // trackId : 1108737253
 // artistName : "Drake"
 // collectionName : "Views"
 // trackName : "Keep the Family Close"
 collectionCensoredName : "Views"
 trackCensoredName : "Keep the Family Close"
 artistViewUrl : "https://itunes.apple.com/us/artist/drake/id271256?uo=4"
 collectionViewUrl : "https://itunes.apple.com/us/album/keep-the-family-close/id1108737195?i=1108737253&uo=4"
 trackViewUrl : "https://itunes.apple.com/us/album/keep-the-family-close/id1108737195?i=1108737253&uo=4"
 previewUrl : "http://audio.itunes.apple.com/apple-assets-us-std-000001/AudioPreview60/v4/33/94/6e/33946e2c-aa78-ca0f-b33e-0ccbfc911649/mzaf_6566234269237589472.plus.aac.p.m4a"
 artworkUrl30 : "http://is1.mzstatic.com/image/thumb/Music60/v4/54/06/a3/5406a3ee-262c-b1d4-66be-9d333fe54bae/source/30x30bb.jpg"
 artworkUrl60 : "http://is1.mzstatic.com/image/thumb/Music60/v4/54/06/a3/5406a3ee-262c-b1d4-66be-9d333fe54bae/source/60x60bb.jpg"
 artworkUrl100 : "http://is1.mzstatic.com/image/thumb/Music60/v4/54/06/a3/5406a3ee-262c-b1d4-66be-9d333fe54bae/source/100x100bb.jpg"
 collectionPrice : 13.99
 trackPrice : -1
 // releaseDate : "2016-04-29T07:00:00Z"
 collectionExplicitness : "explicit"
 trackExplicitness : "explicit"
 discCount : 1
 discNumber : 1
 trackCount : 20
 // trackNumber : 1
 // trackTimeMillis : 328910
 country : "USA"
 currency : "USD"
 primaryGenreName : "Hip-Hop/Rap"
 contentAdvisoryRating : "Explicit"
 // isStreamable : true
 */
 