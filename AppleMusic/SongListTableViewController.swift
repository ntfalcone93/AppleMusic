//
//  SongListTableViewController.swift
//  AppleMusic
//
//  Created by Nathan on 5/4/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    
    var album: Album?
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSongsForAlbum(album)
    }
    
    func fetchSongsForAlbum(album: Album?) {
        guard let album = album else {
            return
        }
        MusicController.fetchSongsForAlbum(album) { (songs) in
            self.songs = songs
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.trackName
        cell.detailTextLabel?.text = "\(song.trackNumber) \(song.trackTime)"
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == "toSongDetail",
            let songDetailVC = segue.destinationViewController as? SongDetailViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPathForCell(cell),
            let album = album else {
                return
        }
        let song = songs[indexPath.row]
        songDetailVC.song = song
        songDetailVC.album = album
    }
}
