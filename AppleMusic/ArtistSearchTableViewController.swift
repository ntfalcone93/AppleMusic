//
//  ArtistSearchTableViewController.swift
//  AppleMusic
//
//  Created by Nathan on 5/1/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class ArtistSearchTableViewController: UITableViewController {
    
    var searchResults = [Artist]()
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }
    
    func setupSearchBar() {
        searchBar.frame = CGRect(x: 0, y: 0, width: CGFloat(view.frame.width - 22), height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchResults.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("artistCell", forIndexPath: indexPath)
        
        let artist = searchResults[indexPath.row]
        
        cell.textLabel?.text = artist.name
        cell.detailTextLabel?.text = artist.genre
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard segue.identifier == "toAlbumList",
            let albumListTVC = segue.destinationViewController as? AlbumListTableViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPathForCell(cell) else {
                return
        }
        let artist = searchResults[indexPath.row]
        albumListTVC.artist = artist
    }
}

extension ArtistSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let searchTerm = searchBar.text {
            MusicController.searchForArtistWithTerm(searchTerm, completion: { (artists) in
                self.searchResults = artists
                self.tableView.reloadData()
            })
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
