//
//  SongDetailViewController.swift
//  AppleMusic
//
//  Created by Nathan on 5/4/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    var song: Song?
    var album: Album?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAlbumWithArtwork(album)
    }
    
    func updateAlbumWithArtwork(album: Album?) {
        guard let album = album else {
            return
        }
        MusicController.fetchArtworkForAlbum(album) { (album) in
            self.album = album
            self.imageView.image = album.artworkImage
        }
    }
    
    @IBAction func previousButtonTapped(sender: AnyObject) {
        song?.trackId
    }
    
    @IBAction func playPauseButtonTapped(sender: AnyObject) {
        if let song = song {
            let trackIdString = String(song.trackId)
            PlayerController.sharedPlayer.playTrack(trackIdString)
        }
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        
    }
}
