//
//  AlbumListTableViewController.swift
//  AppleMusic
//
//  Created by Nathan on 5/4/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class AlbumListTableViewController: UITableViewController {
    
    var artist: Artist?
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAlbumsForArtist(artist)
    }
    
    func fetchAlbumsForArtist(artist: Artist?) {
        guard let artist = artist else {
            print("Could not unwrap artist in \(#function)")
            return
        }
        MusicController.fetchAlbumsForArtist(artist) { (albums) in
            self.albums = albums
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("albumCell", forIndexPath: indexPath)
        
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.albumName
        cell.detailTextLabel?.text = album.explicitString
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == "toSongList",
            let songListTVC = segue.destinationViewController as? SongListTableViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPathForCell(cell) else {
                return
        }
        let album = albums[indexPath.row]
        songListTVC.album = album
    }
}
