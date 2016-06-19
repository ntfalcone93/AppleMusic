//
//  MusicController.swift
//  AppleMusic
//
//  Created by Nathan on 5/1/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

// Artist search https://itunes.apple.com/search?term=Drake&media=music&entity=musicArtist
// Artist albums search https://itunes.apple.com/lookup?id=271256&media=music&entity=album&attribute=albumTerm
// Albums songs search https://itunes.apple.com/lookup?id=1108737195&entity=song


class MusicController {
    
    // MARK: - urls
    static func artistSearchUrl(artist: String) -> NSURL? {
        guard let url = NSURL(string: "https://itunes.apple.com/search?term=\(artist)&media=music&entity=musicArtist") else {
            return nil
        }
        return url
    }
    
    static func albumsForArtistUrl(id: Int) -> NSURL? {
        let idString = String(id)
        guard let url = NSURL(string: "https://itunes.apple.com/lookup?id=\(idString)&media=music&entity=album") else {
            return nil
        }
        return url
    }
    
    static func songsForAlbumUrl(id: Int) -> NSURL? {
        let idString = String(id)
        guard let url = NSURL(string: "https://itunes.apple.com/lookup?id=\(idString)&entity=song") else {
            return nil
        }
        return url
    }
    
    static func searchForArtistWithTerm(term: String, completion: (artists: [Artist]) -> Void) {
        guard let url = artistSearchUrl(term) else {
            completion(artists: [])
            return
        }
        NetworkController.dataAtUrl(url) { (data) in
            guard let data = data,
                jsonDict = NetworkController.serializeJsonData(data) as? [String: AnyObject],
                resultsArray = jsonDict["results"] as? [[String: AnyObject]] else {
                    completion(artists: [])
                    return
            }
            var artists = [Artist]()
            for artist in resultsArray {
                if let artist = Artist(dictionary: artist) {
                    artists.append(artist)
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(artists: artists)
            })
        }
    }
    
    static func fetchAlbumsForArtist(artist: Artist, completion: (albums: [Album]) -> Void) {
        guard let url = MusicController.albumsForArtistUrl(artist.artistId) else {
            print("Could not use url for artist")
            completion(albums: [])
            return
        }
        NetworkController.dataAtUrl(url) { (data) in
            guard let data = data,
                jsonDict = NetworkController.serializeJsonData(data),
                albumDicts = jsonDict["results"] as? [[String: AnyObject]] else {
                    completion(albums: [])
                    return
            }
            var albums = [Album]()
            for albumDict in albumDicts {
                if let album = Album(dictionary: albumDict) {
                    albums.append(album)
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(albums: albums)
            })
        }
    }
    
    static func fetchSongsForAlbum(album: Album, completion: (songs: [Song]) -> Void) {
        guard let url = MusicController.songsForAlbumUrl(album.albumId) else {
            print("Could not use url for album")
            completion(songs: [])
            return
        }
        NetworkController.dataAtUrl(url) { (data) in
            guard let data = data,
                jsonDict = NetworkController.serializeJsonData(data),
                songDicts = jsonDict["results"] as? [[String: AnyObject]] else {
                    completion(songs: [])
                    return
            }
            var songs = [Song]()
            for songDict in songDicts {
                if let song = Song(dictionary: songDict) {
                    songs.append(song)
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(songs: songs)
            })
        }
    }
    
    static func fetchArtworkForAlbum(album: Album, completion: (album: Album) -> Void) {
        guard let url = NSURL(string: "\(album.artworkUrlString)") else {
            completion(album: album)
            return
        }
        ImageController.imageForURL(url) { (image) in
            guard let image = image else {
                completion(album: album)
                return
            }
            album.artworkImage = image
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(album: album)
            })
        }
    }
}